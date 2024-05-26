import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:pokemon3/models/pokemon.dart';
import 'package:pokemon3/models/pokemon_type.dart';

part 'pokeapi.g.dart';

@RestApi(baseUrl: "https://pokeapi.co/api/v2")
abstract class PokeApi {
  factory PokeApi(Dio dio, {String baseUrl}) = _PokeApi;

  @GET("/pokemon/{name}")
  Future<Pokemon> getPokemon(@Path("name") String name);

  @GET("/type/{type}")
  Future<PokemonType> getType(@Path("type") String type);
}
