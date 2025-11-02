import 'package:dio/dio.dart';
import '../models/character.dart';

class CharacterRepository {
  // Используем CORS прокси
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://corsproxy.io/?',
  ));

  Future<List<Character>> getCharacters(int page) async {
    try {
      // Проксируем запрос через corsproxy.io
      final response = await _dio.get(
        'https://rickandmortyapi.com/api/character?page=$page'
      );
      
      if (response.statusCode == 200) {
        final List<dynamic> results = response.data['results'];
        return results.map((json) => Character.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load characters');
      }
    } catch (e) {
      throw Exception('Failed to load characters: $e');
    }
  }
}