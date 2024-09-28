import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokemon_challenge/domain/entities/pokemon_detail.dart';
import 'package:pokemon_challenge/domain/usecases/get_pokemon_detail_usecase.dart';

import '../../test_helpers.mocks.dart';

void main() {
  late GetPokemonDetailUseCase useCase;
  late MockPokemonRepository mockRepository;

  setUp(() {
    mockRepository = MockPokemonRepository();
    useCase = GetPokemonDetailUseCase(mockRepository);
  });

  final pokemonDetail = PokemonDetail(
    id: 1,
    baseExperience: 64,
    height: 7,
    weight: 69,
    types: ['grass', 'poison'],
    sprites: ['sprite1', 'sprite2'],
  );

  test('Deve obter os detalhes do Pokémon do repositório', () async {
    // Arrange
    when(mockRepository.getPokemonDetail(1))
        .thenAnswer((_) async => pokemonDetail);

    // Act
    final result = await useCase(1);

    // Assert
    expect(result, pokemonDetail);
    verify(mockRepository.getPokemonDetail(1));
    verifyNoMoreInteractions(mockRepository);
  });

  test('Deve lançar uma exceção quando ocorrer um erro', () async {
    // Arrange
    when(mockRepository.getPokemonDetail(1))
        .thenThrow(Exception('Erro no repositório'));

    // Act
    expect(() => useCase(1), throwsException);

    // Assert
    verify(mockRepository.getPokemonDetail(1));
    verifyNoMoreInteractions(mockRepository);
  });
}
