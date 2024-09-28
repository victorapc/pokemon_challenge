import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

import 'package:pokemon_challenge/data/datasources/pokemon_remote_datasource.dart';
import 'package:pokemon_challenge/domain/repositories/pokemon_repository.dart';
import 'package:pokemon_challenge/domain/usecases/get_pokemon_detail_usecase.dart';
import 'package:pokemon_challenge/domain/usecases/get_pokemons_usecase.dart';
import 'package:pokemon_challenge/presentation/stores/pokemon_store.dart';

@GenerateMocks([
  PokemonRepository,
  PokemonRemoteDataSource,
  http.Client,
  GetPokemonsUseCase,
  GetPokemonDetailUseCase,
  PokemonStore,
])
void main() {}
