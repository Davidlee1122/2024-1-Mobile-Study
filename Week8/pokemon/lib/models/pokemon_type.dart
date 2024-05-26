import 'package:json_annotation/json_annotation.dart';

part 'pokemon_type.g.dart';

@JsonSerializable()
class PokemonType {
  final DamageRelations damage_relations;

  PokemonType({required this.damage_relations});

  factory PokemonType.fromJson(Map<String, dynamic> json) => _$PokemonTypeFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonTypeToJson(this);
}

@JsonSerializable()
class DamageRelations {
  final List<PokemonTypeInfo> double_damage_from;
  final List<PokemonTypeInfo> double_damage_to;
  final List<PokemonTypeInfo> no_damage_from;
  final List<PokemonTypeInfo> no_damage_to;

  DamageRelations({
    required this.double_damage_from,
    required this.double_damage_to,
    required this.no_damage_from,
    required this.no_damage_to,
  });

  factory DamageRelations.fromJson(Map<String, dynamic> json) => _$DamageRelationsFromJson(json);
  Map<String, dynamic> toJson() => _$DamageRelationsToJson(this);
}

@JsonSerializable()
class PokemonTypeInfo {
  final String name;

  PokemonTypeInfo({required this.name});

  factory PokemonTypeInfo.fromJson(Map<String, dynamic> json) => _$PokemonTypeInfoFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonTypeInfoToJson(this);
}
