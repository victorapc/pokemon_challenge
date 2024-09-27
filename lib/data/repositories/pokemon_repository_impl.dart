import 'package:pokemon_challenge/domain/entities/pokemon_detail.dart';

import '../../domain/entities/pokemon.dart';
import '../../domain/repositories/pokemon_repository.dart';
import '../datasources/pokemon_remote_datasource.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDataSource remoteDataSource;

  PokemonRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Pokemon>> getPokemons() async {
    return await remoteDataSource.getPokemons();
  }

  @override
  Future<PokemonDetail> getPokemonDetail(int id) async {
    final detailModel = await remoteDataSource.getPokemonDetail(id);

    // Converter o modelo para a entidade de domínio
    return PokemonDetail(
      id: detailModel.id,
      baseExperience: detailModel.baseExperience,
      height: detailModel.height,
      weight: detailModel.weight,
      types: detailModel.types.map((t) => t.type.name).toList(),
      sprites: [
        if (detailModel.sprites.frontDefault != null)
          detailModel.sprites.frontDefault!,
        if (detailModel.sprites.backDefault != null)
          detailModel.sprites.backDefault!,
        if (detailModel.sprites.frontShiny != null)
          detailModel.sprites.frontShiny!,
        if (detailModel.sprites.backShiny != null)
          detailModel.sprites.backShiny!,
      ],
    );
  }
}
