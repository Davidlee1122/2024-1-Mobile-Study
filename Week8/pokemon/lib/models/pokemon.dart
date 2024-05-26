import 'package:json_annotation/json_annotation.dart';
import 'package:pokemon3/models/type_info.dart';

part 'pokemon.g.dart';

@JsonSerializable()
class Pokemon {
  final int id;
  final String name;
  final Sprites sprites;
  final List<TypeInfo> types;
  final double height;
  final double weight;

  Pokemon({
    required this.id,
    required this.name,
    required this.sprites,
    required this.types,
    required this.height,
    required this.weight,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) => _$PokemonFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonToJson(this);
}

@JsonSerializable()
class Sprites {
  @JsonKey(name: 'front_default')
  final String frontDefault;
  final String backDefault;
  final String backShiny;
  final String frontShiny;

  Sprites({
    required this.frontDefault,
    required this.backDefault,
    required this.backShiny,
    required this.frontShiny,});

  factory Sprites.fromJson(Map<String, dynamic> json) => _$SpritesFromJson(json);
  Map<String, dynamic> toJson() => _$SpritesToJson(this);
}

