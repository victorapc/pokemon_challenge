import 'package:mobx/mobx.dart';
import '../../domain/entities/pokemon_detail.dart';
import '../../domain/usecases/get_pokemon_detail_usecase.dart';

part 'pokemon_detail_store.g.dart';

class PokemonDetailStore = _PokemonDetailStoreBase with _$PokemonDetailStore;

abstract class _PokemonDetailStoreBase with Store {
  final GetPokemonDetailUseCase getPokemonDetailUseCase;

  _PokemonDetailStoreBase({required this.getPokemonDetailUseCase});

  @observable
  PokemonDetail? pokemonDetail;

  @observable
  bool isLoading = false;

  @observable
  String errorMessage = '';

  @action
  Future<void> loadPokemonDetail(int id) async {
    isLoading = true;
    errorMessage = '';
    try {
      final result = await getPokemonDetailUseCase(id);
      pokemonDetail = result;
    } catch (e) {
      errorMessage = 'Erro ao carregar detalhes do Pokémon';
    } finally {
      isLoading = false;
    }
  }
}
