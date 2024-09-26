import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon_challenge/presentation/stores/battery_store.dart';

import 'data/datasources/battery_info_datasource.dart';
import 'data/datasources/pokemon_remote_datasource.dart';
import 'data/repositories/pokemon_repository_impl.dart';
import 'data/repositories/battery_repository_impl.dart';
import 'domain/repositories/battery_repository.dart';
import 'domain/repositories/pokemon_repository.dart';
import 'domain/usecases/get_pokemons_usecase.dart';
import 'domain/usecases/get_battery_level_usecase.dart';
import 'presentation/stores/pokemon_store.dart';

final getIt = GetIt.instance;

void init() {
  // Stores
  getIt.registerFactory(() => PokemonStore(getPokemonsUseCase: getIt()));
  getIt.registerFactory(() => BatteryStore(getBatteryLevelUseCase: getIt()));

  // UseCases
  getIt.registerLazySingleton(() => GetPokemonsUseCase(getIt()));
  getIt.registerLazySingleton(() => GetBatteryLevelUseCase(getIt()));

  // Repositories
  getIt.registerLazySingleton<PokemonRepository>(
      () => PokemonRepositoryImpl(getIt()));
  getIt.registerLazySingleton<BatteryRepository>(
      () => BatteryRepositoryImpl(getIt()));

  // Data sources
  getIt.registerLazySingleton<PokemonRemoteDataSource>(
      () => PokemonRemoteDataSourceImpl(getIt()));
  getIt.registerLazySingleton<BatteryInfoDataSource>(
      () => BatteryInfoDataSourceImpl());

  // External
  getIt.registerLazySingleton(() => http.Client());
}
