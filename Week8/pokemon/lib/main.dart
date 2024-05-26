import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:pokemon3/api/pokeapi.dart';
import 'package:pokemon3/models/pokemon.dart';
import 'package:pokemon3/models/pokemon_type.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PokeDex',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PokeSearchScreen(),
    );
  }
}

class PokeSearchScreen extends StatefulWidget {
  @override
  _PokeSearchScreenState createState() => _PokeSearchScreenState();
}

class _PokeSearchScreenState extends State<PokeSearchScreen> {
  final TextEditingController _controller = TextEditingController();
  late PokeApi _pokeApi;
  Pokemon? _pokemon;
  List<String> _weaknesses = [];
  List<String> _strengths = [];
  List<String> _noDamageFrom = [];
  List<String> _noDamageTo = [];

  @override
  void initState() {
    super.initState();
    _pokeApi = PokeApi(Dio());
  }

  Future<void> _searchPokemon() async {
    final name = _controller.text.toLowerCase();
    final pokemon = await _pokeApi.getPokemon(name);
    final weaknesses = <String>[];
    final strengths = <String>[];
    final noDamageFrom = <String>[];
    final noDamageTo = <String>[];

    for (var typeInfo in pokemon.types) {
      final typeName = typeInfo.type.name;
      final type = await _pokeApi.getType(typeName);

      weaknesses.addAll(
          type.damage_relations.double_damage_from.map((t) => t.name).toList());
      strengths.addAll(
          type.damage_relations.double_damage_to.map((t) => t.name).toList());
      noDamageFrom.addAll(
          type.damage_relations.no_damage_from.map((t) => t.name).toList());
      noDamageTo.addAll(
          type.damage_relations.no_damage_to.map((t) => t.name).toList());
    }

    setState(() {
      _pokemon = pokemon;
      _weaknesses = weaknesses.toSet().toList(); // 중복 제거
      _strengths = strengths.toSet().toList();
      _noDamageFrom = noDamageFrom.toSet().toList();
      _noDamageTo = noDamageTo.toSet().toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PokeDex'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset('assets/title-removebg-preview.png', height: 100), // 이미지 추가
            SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Search Pokemon',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _searchPokemon,
                ),
              ),
            ),
            if (_pokemon != null) ...[
              SizedBox(height: 20),
              Image.network(_pokemon!.sprites.frontDefault, height: 100, width: 100),
              SizedBox(height: 20),
              Text('Id: ${_pokemon!.id}'),
              Text('Name: ${_pokemon!.name}'),
              Text('Type: ${_pokemon!.types.map((type) => type.type.name).join(', ')}'),
              Text('Height: ${_pokemon!.height / 10}m'),
              Text('Weight: ${_pokemon!.weight / 10}kg'),
              SizedBox(height: 20),
              Text(
                'Weaknesses:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              for (var weakness in _weaknesses)
                Text(
                  weakness,
                  style: TextStyle(fontSize: 14),
                ),
              SizedBox(height: 20),
              Text(
                'Strengths:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              for (var strength in _strengths)
                Text(
                  strength,
                  style: TextStyle(fontSize: 14),
                ),
              SizedBox(height: 20),
              Text(
                'No Damage From:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              for (var noDamage in _noDamageFrom)
                Text(
                  noDamage,
                  style: TextStyle(fontSize: 14),
                ),
              SizedBox(height: 20),
              Text(
                'No Damage To:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              for (var noDamage in _noDamageTo)
                Text(
                  noDamage,
                  style: TextStyle(fontSize: 14),
                ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PokeSearchScreen2(pokemon: _pokemon!),
                    ),
                  );
                },
                child: Text('+'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class PokeSearchScreen2 extends StatelessWidget {
  final Pokemon pokemon;

  PokeSearchScreen2({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Another images'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(child: Image.asset('assets/title-removebg-preview.png', height: 100)), // 이미지 추가
            SizedBox(height: 20),
            Image.network(pokemon.sprites.backDefault, height: 200, width: 200),
            Image.network(pokemon.sprites.frontShiny, height: 200, width: 200),
            Image.network(pokemon.sprites.backShiny, height: 200, width: 200),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go back!'),
            ),
          ],
        ),
      ),
    );
  }
}
