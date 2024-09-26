import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokemon_challenge/core/constants/local_constants.dart';

import '../models/pokemon_model.dart';

abstract class PokemonRemoteDataSource {
  Future<List<PokemonModel>> fetchPokemons();
}

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final http.Client client;

  PokemonRemoteDataSourceImpl(this.client);

  @override
  Future<List<PokemonModel>> fetchPokemons() async {
    final response = await client.get(
      Uri.parse('${LocalConstants.baseUrl}pokemon?limit=100'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<PokemonModel> pokemons = [];

      for (var item in data['results']) {
        pokemons.add(PokemonModel(
          name: item['name'],
          url: item['url'],
        ));
      }

      return pokemons;
    } else {
      throw Exception('Erro ao carregar Pokémons');
    }
  }
}
