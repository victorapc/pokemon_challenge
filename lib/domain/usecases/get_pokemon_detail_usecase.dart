import '../entities/pokemon_detail.dart';
import '../repositories/pokemon_repository.dart';

class GetPokemonDetailUseCase {
  final PokemonRepository repository;

  GetPokemonDetailUseCase(this.repository);

  Future<PokemonDetail> call(int id) async {
    return await repository.getPokemonDetail(id);
  }
}
