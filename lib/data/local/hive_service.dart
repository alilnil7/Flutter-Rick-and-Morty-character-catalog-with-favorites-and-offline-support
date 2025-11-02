import '../models/character.dart';

class HiveService {
  static List<Character> favorites = []; // Временное хранилище вместо Hive

  static Future<void> init() async {
    // Временно ничего не инициализируем
    await Future.delayed(Duration.zero);
  }

  static Future<void> addToFavorites(Character character) async {
    favorites.add(character);
  }

  static Future<void> removeFromFavorites(int characterId) async {
    favorites.removeWhere((character) => character.id == characterId);
  }

  static List<Character> getFavorites() {
    return List.from(favorites);
  }

  static bool isFavorite(int characterId) {
    return favorites.any((character) => character.id == characterId);
  }

  // Временные методы для кеширования
  static Future<void> cacheCharacters(int page, List<Character> characters) async {
    // Пока не реализуем
  }

  static List<Character>? getCachedCharacters(int page) {
    return null;
  }
}