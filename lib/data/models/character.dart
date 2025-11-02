import 'package:hive/hive.dart';

part 'character.g.dart';

@HiveType(typeId: 0)
class Character {
  @HiveField(0)
  final int id;
  
  @HiveField(1)
  final String name;
  
  @HiveField(2)
  final String status;
  
  @HiveField(3)
  final String species;
  
  @HiveField(4)
  final String type;
  
  @HiveField(5)
  final String gender;
  
  @HiveField(6)
  final String image;
  
  @HiveField(7)
  final String location;
  
  @HiveField(8)
  final String origin;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.image,
    required this.location,
    required this.origin,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      type: json['type'],
      gender: json['gender'],
      image: json['image'],
      location: json['location']['name'],
      origin: json['origin']['name'],
    );
  }

  Character copyWith({
    int? id,
    String? name,
    String? status,
    String? species,
    String? type,
    String? gender,
    String? image,
    String? location,
    String? origin,
  }) {
    return Character(
      id: id ?? this.id,
      name: name ?? this.name,
      status: status ?? this.status,
      species: species ?? this.species,
      type: type ?? this.type,
      gender: gender ?? this.gender,
      image: image ?? this.image,
      location: location ?? this.location,
      origin: origin ?? this.origin,
    );
  }
}