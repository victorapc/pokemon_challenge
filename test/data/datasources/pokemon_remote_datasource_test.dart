import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:pokemon_challenge/data/datasources/pokemon_remote_datasource.dart';
import 'package:pokemon_challenge/data/models/pokemon_detail_model.dart';
import 'package:pokemon_challenge/data/models/pokemon_model.dart';

import '../../test_helpers.mocks.dart';

void main() {
  late PokemonRemoteDataSourceImpl dataSource;
  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    dataSource = PokemonRemoteDataSourceImpl(mockHttpClient);
  });

  group('fetchPokemons', () {
    final responseJson = {
      "results": [
        {"name": "bulbasaur", "url": "https://pokeapi.co/api/v2/pokemon/1/"}
      ]
    };

    final detailJson = {
      "id": 1,
      "name": "bulbasaur",
      "sprites": {"front_default": "url1"}
    };

    test(
        'Deve retornar uma lista de PokemonModel quando a resposta for sucesso (200)',
        () async {
      // Arrange
      when(mockHttpClient
              .get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=100')))
          .thenAnswer(
              (_) async => http.Response(json.encode(responseJson), 200));

      when(mockHttpClient
              .get(Uri.parse('https://pokeapi.co/api/v2/pokemon/1/')))
          .thenAnswer((_) async => http.Response(json.encode(detailJson), 200));

      // Act
      final result = await dataSource.getPokemons();

      // Assert
      expect(result, isA<List<PokemonModel>>());
      expect(result.length, 1);
      expect(result[0].name, 'bulbasaur');
    });

    test('Deve lançar uma exceção quando a resposta for erro', () async {
      // Arrange
      when(mockHttpClient
              .get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=100')))
          .thenAnswer((_) async => http.Response('Erro', 404));

      // Act
      expect(() => dataSource.getPokemons(), throwsException);

      // Assert
      verify(mockHttpClient
          .get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=100')));
      verifyNoMoreInteractions(mockHttpClient);
    });
  });

  group('fetchPokemonDetail', () {
    final detailJson = {
      "id": 1,
      "base_experience": 64,
      "height": 7,
      "weight": 69,
      "types": [
        {
          "type": {"name": "grass"}
        },
        {
          "type": {"name": "poison"}
        }
      ],
      "sprites": {
        "front_default": "sprite1",
        "back_default": "sprite2",
        "front_shiny": "sprite3",
        "back_shiny": "sprite4"
      }
    };

    test('Deve retornar PokemonDetailModel quando a resposta for sucesso (200)',
        () async {
      // Arrange
      when(mockHttpClient.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/1')))
          .thenAnswer((_) async => http.Response(json.encode(detailJson), 200));

      // Act
      final result = await dataSource.getPokemonDetail(1);

      // Assert
      expect(result, isA<PokemonDetailModel>());
      expect(result.id, 1);
      expect(result.baseExperience, 64);
    });

    test('Deve lançar uma exceção quando a resposta for erro', () async {
      // Arrange
      when(mockHttpClient.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/1')))
          .thenAnswer((_) async => http.Response('Erro', 404));

      // Act
      expect(() => dataSource.getPokemonDetail(1), throwsException);

      // Assert
      verify(
          mockHttpClient.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/1')));
      verifyNoMoreInteractions(mockHttpClient);
    });
  });
}
