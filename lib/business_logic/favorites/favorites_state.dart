import 'package:equatable/equatable.dart';
import '../../../data/models/character.dart';

class FavoritesState extends Equatable {
  final List<Character> favorites;
  final bool isLoading;

  const FavoritesState({
    this.favorites = const [],
    this.isLoading = false,
  });

  FavoritesState copyWith({
    List<Character>? favorites,
    bool? isLoading,
  }) {
    return FavoritesState(
      favorites: favorites ?? this.favorites,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [favorites, isLoading];
}