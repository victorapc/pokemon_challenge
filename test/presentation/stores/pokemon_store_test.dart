import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokemon_challenge/domain/entities/pokemon.dart';
import 'package:pokemon_challenge/presentation/stores/pokemon_store.dart';

import '../../test_helpers.mocks.dart';

void main() {
  late PokemonStore store;
  late MockGetPokemonsUseCase mockGetPokemonsUseCase;

  setUp(() {
    mockGetPokemonsUseCase = MockGetPokemonsUseCase();
    store = PokemonStore(getPokemonsUseCase: mockGetPokemonsUseCase);
  });

  final pokemons = [
    Pokemon(name: 'bulbasaur', url: 'url1'),
    Pokemon(name: 'ivysaur', url: 'url2'),
  ];

  test('Deve carregar os Pokémons e atualizar o estado corretamente', () async {
    // Arrange
    when(mockGetPokemonsUseCase()).thenAnswer((_) async => pokemons);

    // Act
    await store.loadPokemons();

    // Assert
    expect(store.isLoading, false);
    expect(store.pokemons.length, 2);
    verify(mockGetPokemonsUseCase());
    verifyNoMoreInteractions(mockGetPokemonsUseCase);
  });

  test('Deve tratar erros ao carregar os Pokémons', () async {
    // Arrange
    when(mockGetPokemonsUseCase())
        .thenThrow(Exception('Erro ao carregar Pokémons'));

    // Act
    await store.loadPokemons();

    // Assert
    expect(store.isLoading, false);
    expect(store.pokemons.length, 0);
    // Se você tiver um observable para mensagens de erro, pode verificar aqui
    // Exemplo: expect(store.errorMessage, 'Erro ao carregar Pokémons');
    verify(mockGetPokemonsUseCase());
    verifyNoMoreInteractions(mockGetPokemonsUseCase);
  });

  test('Deve filtrar os Pokémons corretamente', () async {
    // Arrange
    when(mockGetPokemonsUseCase()).thenAnswer((_) async => pokemons);

    // Act
    await store.loadPokemons();
    store.setSearchText('BULB');

    // Assert
    expect(store.filteredPokemons.length, 1);
    expect(store.filteredPokemons[0].name, 'bulbasaur');
  });
}
