import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/favorites/favorites_cubit.dart';
import '../../business_logic/favorites/favorites_state.dart';
import '../../data/models/character.dart';

class CharacterCard extends StatelessWidget {
  final Character character;

  const CharacterCard({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Изображение персонажа
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: character.image,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  width: 80,
                  height: 80,
                  color: Colors.grey[300],
                  child: const Icon(Icons.person, size: 40, color: Colors.grey),
                ),
                errorWidget: (context, url, error) => Container(
                  width: 80,
                  height: 80,
                  color: Colors.grey[300],
                  child: const Icon(Icons.error, color: Colors.red),
                ),
              ),
            ),
            const SizedBox(width: 12),
            
            // Информация о персонаже
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    character.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  _buildInfoRow('Status', character.status),
                  _buildInfoRow('Species', character.species),
                  _buildInfoRow('Gender', character.gender),
                  if (character.location.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      'Location: ${character.location}',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            ),
            
            // Кнопка избранного
            BlocBuilder<FavoritesCubit, FavoritesState>(
              builder: (context, state) {
                final isFavorite = state.favorites.any((fav) => fav.id == character.id);
                return IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.grey,
                  ),
                  onPressed: () {
                    final favoritesCubit = context.read<FavoritesCubit>();
                    if (isFavorite) {
                      favoritesCubit.removeFromFavorites(character.id);
                    } else {
                      favoritesCubit.addToFavorites(character);
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      children: [
        Text(
          '$label: ',
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 12,
            color: _getStatusColor(value),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'alive':
        return Colors.green;
      case 'dead':
        return Colors.red;
      case 'unknown':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }
}