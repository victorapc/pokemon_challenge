import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'data/datasources/pokemon_remote_datasource.dart';
import 'data/repositories/pokemon_repository_impl.dart';
import 'domain/repositories/pokemon_repository.dart';
import 'domain/usecases/get_pokemons_usecase.dart';
import 'presentation/stores/pokemon_store.dart';

final getIt = GetIt.instance;

void init() {
  // Stores
  getIt.registerFactory(() => PokemonStore(getPokemonsUseCase: getIt()));

  // UseCases
  getIt.registerLazySingleton(() => GetPokemonsUseCase(getIt()));

  // Repositories
  getIt.registerLazySingleton<PokemonRepository>(
      () => PokemonRepositoryImpl(getIt()));

  // Data sources
  getIt.registerLazySingleton<PokemonRemoteDataSource>(
      () => PokemonRemoteDataSourceImpl(getIt()));

  // External
  getIt.registerLazySingleton(() => http.Client());
}
