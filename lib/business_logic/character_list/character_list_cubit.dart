import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repositories/character_repository.dart';
import 'character_list_state.dart';

class CharacterListCubit extends Cubit<CharacterListState> {
  final CharacterRepository _repository;
  int _currentPage = 1;
  bool _isFetching = false;

  CharacterListCubit() : _repository = CharacterRepository(), super(const CharacterListState());

  Future<void> loadCharacters() async {
    if (_isFetching || state.hasReachedMax) return;

    _isFetching = true;
    emit(state.copyWith(isLoading: true, hasError: false));

    try {
      final newCharacters = await _repository.getCharacters(_currentPage);
      
      final hasReachedMax = newCharacters.isEmpty;
      
      emit(state.copyWith(
        characters: [...state.characters, ...newCharacters],
        isLoading: false,
        hasReachedMax: hasReachedMax,
      ));

      if (newCharacters.isNotEmpty) {
        _currentPage++;
      }
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        hasError: true,
        errorMessage: e.toString(),
      ));
    } finally {
      _isFetching = false;
    }
  }

  void refresh() {
    _currentPage = 1;
    _isFetching = false;
    emit(const CharacterListState());
    loadCharacters();
  }
}