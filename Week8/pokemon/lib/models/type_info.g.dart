// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypeInfo _$TypeInfoFromJson(Map<String, dynamic> json) => TypeInfo(
      type: PokemonTypeInfo.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TypeInfoToJson(TypeInfo instance) => <String, dynamic>{
      'type': instance.type,
    };

PokemonTypeInfo _$PokemonTypeInfoFromJson(Map<String, dynamic> json) =>
    PokemonTypeInfo(
      name: json['name'] as String,
    );

Map<String, dynamic> _$PokemonTypeInfoToJson(PokemonTypeInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
