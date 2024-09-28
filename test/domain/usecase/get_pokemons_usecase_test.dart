import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokemon_challenge/domain/entities/pokemon.dart';
import 'package:pokemon_challenge/domain/usecases/get_pokemons_usecase.dart';

import '../../test_helpers.mocks.dart';

void main() {
  late GetPokemonsUseCase useCase;
  late MockPokemonRepository mockRepository;

  setUp(() {
    mockRepository = MockPokemonRepository();
    useCase = GetPokemonsUseCase(mockRepository);
  });

  final pokemons = [
    Pokemon(name: 'bulbasaur', url: 'url1'),
    Pokemon(name: 'ivysaur', url: 'url2'),
  ];

  test('Deve obter a lista de Pokémons do repositório', () async {
    // Arrange
    when(mockRepository.getPokemons()).thenAnswer((_) async => pokemons);

    // Act
    final result = await useCase();

    // Assert
    expect(result, pokemons);
    verify(mockRepository.getPokemons());
    verifyNoMoreInteractions(mockRepository);
  });

  test('Deve lançar uma exceção quando ocorrer um erro', () async {
    // Arrange
    when(mockRepository.getPokemons())
        .thenThrow(Exception('Erro no repositório'));

    // Act
    expect(() => useCase(), throwsException);

    // Assert
    verify(mockRepository.getPokemons());
    verifyNoMoreInteractions(mockRepository);
  });
}
