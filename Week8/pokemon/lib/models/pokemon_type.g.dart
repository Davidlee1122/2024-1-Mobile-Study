// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonType _$PokemonTypeFromJson(Map<String, dynamic> json) => PokemonType(
      damage_relations: DamageRelations.fromJson(
          json['damage_relations'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonTypeToJson(PokemonType instance) =>
    <String, dynamic>{
      'damage_relations': instance.damage_relations,
    };

DamageRelations _$DamageRelationsFromJson(Map<String, dynamic> json) =>
    DamageRelations(
      double_damage_from: (json['double_damage_from'] as List<dynamic>)
          .map((e) => PokemonTypeInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      double_damage_to: (json['double_damage_to'] as List<dynamic>)
          .map((e) => PokemonTypeInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      no_damage_from: (json['no_damage_from'] as List<dynamic>)
          .map((e) => PokemonTypeInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      no_damage_to: (json['no_damage_to'] as List<dynamic>)
          .map((e) => PokemonTypeInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DamageRelationsToJson(DamageRelations instance) =>
    <String, dynamic>{
      'double_damage_from': instance.double_damage_from,
      'double_damage_to': instance.double_damage_to,
      'no_damage_from': instance.no_damage_from,
      'no_damage_to': instance.no_damage_to,
    };

PokemonTypeInfo _$PokemonTypeInfoFromJson(Map<String, dynamic> json) =>
    PokemonTypeInfo(
      name: json['name'] as String,
    );

Map<String, dynamic> _$PokemonTypeInfoToJson(PokemonTypeInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
