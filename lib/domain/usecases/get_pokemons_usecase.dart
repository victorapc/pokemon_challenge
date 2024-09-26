import 'package:pokemon_challenge/domain/entities/pokemon.dart';

import '../repositories/pokemon_repository.dart';

class GetPokemonsUseCase {
  final PokemonRepository repository;

  GetPokemonsUseCase(this.repository);

  Future<List<Pokemon>> call() async {
    return await repository.getPokemons();
  }
}
