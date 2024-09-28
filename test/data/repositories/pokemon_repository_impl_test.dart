import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokemon_challenge/data/models/pokemon_detail_model.dart';
import 'package:pokemon_challenge/data/models/pokemon_model.dart';
import 'package:pokemon_challenge/data/repositories/pokemon_repository_impl.dart';
import 'package:pokemon_challenge/domain/entities/pokemon.dart';
import 'package:pokemon_challenge/domain/entities/pokemon_detail.dart';

import '../../test_helpers.mocks.dart';

void main() {
  late PokemonRepositoryImpl repository;
  late MockPokemonRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockPokemonRemoteDataSource();
    repository = PokemonRepositoryImpl(mockRemoteDataSource);
  });

  group('getPokemons', () {
    final pokemonModels = [
      PokemonModel(name: 'bulbasaur', url: 'url1'),
      PokemonModel(name: 'ivysaur', url: 'url2'),
    ];

    test(
        'Deve retornar uma lista de Pokémons quando o data source for bem-sucedido',
        () async {
      // Arrange
      when(mockRemoteDataSource.getPokemons())
          .thenAnswer((_) async => pokemonModels);

      // Act
      final result = await repository.getPokemons();

      // Assert
      expect(result, isA<List<Pokemon>>());
      expect(result.length, 2);
      verify(mockRemoteDataSource.getPokemons());
      verifyNoMoreInteractions(mockRemoteDataSource);
    });

    test('Deve lançar uma exceção quando o data source falhar', () async {
      // Arrange
      when(mockRemoteDataSource.getPokemons())
          .thenThrow(Exception('Erro no data source'));

      // Act
      expect(() => repository.getPokemons(), throwsException);

      // Assert
      verify(mockRemoteDataSource.getPokemons());
      verifyNoMoreInteractions(mockRemoteDataSource);
    });
  });

  group('getPokemonDetail', () {
    final detailModel = PokemonDetailModel(
      id: 1,
      baseExperience: 64,
      height: 7,
      weight: 69,
      types: [
        TypeModel(type: TypeInfoModel(name: 'grass')),
        TypeModel(type: TypeInfoModel(name: 'poison')),
      ],
      sprites: SpritesModel(
        frontDefault: 'sprite1',
        backDefault: 'sprite2',
        frontShiny: 'sprite3',
        backShiny: 'sprite4',
      ),
    );

    test(
        'Deve retornar os detalhes do Pokémon quando o data source for bem-sucedido',
        () async {
      // Arrange
      when(mockRemoteDataSource.getPokemonDetail(1))
          .thenAnswer((_) async => detailModel);

      // Act
      final result = await repository.getPokemonDetail(1);

      // Assert
      expect(result, isA<PokemonDetail>());
      expect(result.id, 1);
      expect(result.types, ['grass', 'poison']);
      verify(mockRemoteDataSource.getPokemonDetail(1));
      verifyNoMoreInteractions(mockRemoteDataSource);
    });

    test('Deve lançar uma exceção quando o data source falhar', () async {
      // Arrange
      when(mockRemoteDataSource.getPokemonDetail(1))
          .thenThrow(Exception('Erro no data source'));

      // Act
      expect(() => repository.getPokemonDetail(1), throwsException);

      // Assert
      verify(mockRemoteDataSource.getPokemonDetail(1));
      verifyNoMoreInteractions(mockRemoteDataSource);
    });
  });
}
