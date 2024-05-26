import 'package:json_annotation/json_annotation.dart';

part 'type_info.g.dart';

@JsonSerializable()
class TypeInfo {
  final PokemonTypeInfo type;

  TypeInfo({required this.type});

  factory TypeInfo.fromJson(Map<String, dynamic> json) => _$TypeInfoFromJson(json);
  Map<String, dynamic> toJson() => _$TypeInfoToJson(this);
}

@JsonSerializable()
class PokemonTypeInfo {
  final String name;

  PokemonTypeInfo({required this.name});

  factory PokemonTypeInfo.fromJson(Map<String, dynamic> json) => _$PokemonTypeInfoFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonTypeInfoToJson(this);
}
