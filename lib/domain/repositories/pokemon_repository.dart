import 'package:pokemon_challenge/domain/entities/pokemon.dart';

import '../entities/pokemon_detail.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>> getPokemons();
  Future<PokemonDetail> getPokemonDetail(int id);
}
