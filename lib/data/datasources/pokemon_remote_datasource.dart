import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokemon_challenge/core/constants/local_constants.dart';

import '../models/pokemon_detail_model.dart';
import '../models/pokemon_model.dart';

abstract class PokemonRemoteDataSource {
  Future<List<PokemonModel>> getPokemons();
  Future<PokemonDetailModel> getPokemonDetail(int id);
}

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final http.Client client;

  PokemonRemoteDataSourceImpl(this.client);

  @override
  Future<List<PokemonModel>> getPokemons() async {
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

  @override
  Future<PokemonDetailModel> getPokemonDetail(int id) async {
    final response = await client.get(
      Uri.parse('${LocalConstants.baseUrl}pokemon/$id'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return PokemonDetailModel.fromJson(data);
    } else {
      throw Exception('Erro ao carregar detalhes do Pokémon');
    }
  }
}
