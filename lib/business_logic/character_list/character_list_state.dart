import 'package:equatable/equatable.dart';
import '../../../data/models/character.dart';

class CharacterListState extends Equatable {
  final List<Character> characters;
  final bool isLoading;
  final bool hasError;
  final String errorMessage;
  final bool hasReachedMax;

  const CharacterListState({
    this.characters = const [],
    this.isLoading = false,
    this.hasError = false,
    this.errorMessage = '',
    this.hasReachedMax = false,
  });

  CharacterListState copyWith({
    List<Character>? characters,
    bool? isLoading,
    bool? hasError,
    String? errorMessage,
    bool? hasReachedMax,
  }) {
    return CharacterListState(
      characters: characters ?? this.characters,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      errorMessage: errorMessage ?? this.errorMessage,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props => [
        characters,
        isLoading,
        hasError,
        errorMessage,
        hasReachedMax,
      ];
}