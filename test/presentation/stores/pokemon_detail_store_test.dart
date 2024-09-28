import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokemon_challenge/domain/entities/pokemon_detail.dart';
import 'package:pokemon_challenge/presentation/stores/pokemon_detail_store.dart';

import '../../test_helpers.mocks.dart';

void main() {
  late PokemonDetailStore store;
  late MockGetPokemonDetailUseCase mockGetPokemonDetailUseCase;

  setUp(() {
    mockGetPokemonDetailUseCase = MockGetPokemonDetailUseCase();
    store = PokemonDetailStore(
        getPokemonDetailUseCase: mockGetPokemonDetailUseCase);
  });

  final pokemonDetail = PokemonDetail(
    id: 1,
    baseExperience: 64,
    height: 7,
    weight: 69,
    types: ['grass', 'poison'],
    sprites: ['sprite1', 'sprite2'],
  );

  test('Deve carregar os detalhes do Pokémon e atualizar o estado corretamente',
      () async {
    // Arrange
    when(mockGetPokemonDetailUseCase(1)).thenAnswer((_) async => pokemonDetail);

    // Act
    await store.loadPokemonDetail(1);

    // Assert
    expect(store.isLoading, false);
    expect(store.pokemonDetail, pokemonDetail);
    expect(store.errorMessage, '');
    verify(mockGetPokemonDetailUseCase(1));
    verifyNoMoreInteractions(mockGetPokemonDetailUseCase);
  });

  test('Deve tratar erros ao carregar os detalhes do Pokémon', () async {
    // Arrange
    when(mockGetPokemonDetailUseCase(1))
        .thenThrow(Exception('Erro ao carregar detalhes'));

    // Act
    await store.loadPokemonDetail(1);

    // Assert
    expect(store.isLoading, false);
    expect(store.pokemonDetail, null);
    expect(store.errorMessage, 'Erro ao carregar detalhes do Pokémon');
    verify(mockGetPokemonDetailUseCase(1));
    verifyNoMoreInteractions(mockGetPokemonDetailUseCase);
  });
}
