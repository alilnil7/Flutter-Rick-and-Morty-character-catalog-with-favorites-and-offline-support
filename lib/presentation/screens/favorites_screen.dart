import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/favorites/favorites_cubit.dart';
import '../../business_logic/favorites/favorites_state.dart'; // ← ДОБАВЬТЕ ЭТОТ ИМПОРТ
import '../widgets/character_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              final cubit = context.read<FavoritesCubit>();
              if (value == 'name') {
                cubit.sortByName();
              } else if (value == 'status') {
                cubit.sortByStatus();
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'name', child: Text('Sort by Name')),
              const PopupMenuItem(value: 'status', child: Text('Sort by Status')),
            ],
          ),
        ],
      ),
      body: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.favorites.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite_border, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'No favorites yet',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Add characters to favorites by tapping the heart icon',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            itemCount: state.favorites.length,
            itemBuilder: (context, index) {
              return CharacterCard(character: state.favorites[index]);
            },
          );
        },
      ),
    );
  }
}