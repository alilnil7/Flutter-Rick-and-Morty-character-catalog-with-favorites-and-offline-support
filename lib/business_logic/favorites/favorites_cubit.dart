import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/local/hive_service.dart';
import '../../../data/models/character.dart';
import 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(const FavoritesState()) {
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    emit(state.copyWith(isLoading: true));
    
    final favorites = HiveService.getFavorites();
    
    emit(state.copyWith(
      favorites: favorites,
      isLoading: false,
    ));
  }

  Future<void> addToFavorites(Character character) async {
    await HiveService.addToFavorites(character);
    await loadFavorites();
  }

  Future<void> removeFromFavorites(int characterId) async {
    await HiveService.removeFromFavorites(characterId);
    await loadFavorites();
  }

  bool isFavorite(int characterId) {
    return HiveService.isFavorite(characterId);
  }

  void sortByName() {
    final sorted = List<Character>.from(state.favorites)
      ..sort((a, b) => a.name.compareTo(b.name));
    emit(state.copyWith(favorites: sorted));
  }

  void sortByStatus() {
    final sorted = List<Character>.from(state.favorites)
      ..sort((a, b) => a.status.compareTo(b.status));
    emit(state.copyWith(favorites: sorted));
  }
}