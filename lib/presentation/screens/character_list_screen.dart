import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/character_list/character_list_cubit.dart';
import '../../business_logic/character_list/character_list_state.dart'; // ← ДОБАВЬТЕ ЭТОТ ИМПОРТ
import '../widgets/character_card.dart';

class CharacterListScreen extends StatefulWidget {
  const CharacterListScreen({super.key});

  @override
  State<CharacterListScreen> createState() => _CharacterListScreenState();
}

class _CharacterListScreenState extends State<CharacterListScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CharacterListCubit>().loadCharacters();
    });
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<CharacterListCubit>().loadCharacters();
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CharacterListCubit, CharacterListState>(
        builder: (context, state) {
          if (state.isLoading && state.characters.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.hasError && state.characters.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  const Text(
                    'Failed to load characters',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    state.errorMessage,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<CharacterListCubit>().refresh();
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              context.read<CharacterListCubit>().refresh();
            },
            child: ListView.builder(
              controller: _scrollController,
              itemCount: state.characters.length + (state.hasReachedMax ? 0 : 1),
              itemBuilder: (context, index) {
                if (index >= state.characters.length) {
                  return state.hasReachedMax
                      ? const SizedBox()
                      : const Padding(
                          padding: EdgeInsets.all(16),
                          child: Center(child: CircularProgressIndicator()),
                        );
                }
                return CharacterCard(character: state.characters[index]);
              },
            ),
          );
        },
      ),
    );
  }
}