import 'package:mobx/mobx.dart';
import '../../domain/entities/pokemon.dart';
import '../../domain/usecases/get_pokemons_usecase.dart';

part 'pokemon_store.g.dart';

class PokemonStore = _PokemonStoreBase with _$PokemonStore;

abstract class _PokemonStoreBase with Store {
  final GetPokemonsUseCase getPokemonsUseCase;

  _PokemonStoreBase({required this.getPokemonsUseCase});

  @observable
  ObservableList<Pokemon> pokemons = ObservableList<Pokemon>();

  @observable
  String searchText = '';

  @observable
  String errorMessage = '';

  @observable
  bool isLoading = false;

  @computed
  List<Pokemon> get filteredPokemons {
    if (searchText.isEmpty) {
      return pokemons;
    } else {
      return pokemons
          .where((p) => p.name.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    }
  }

  @action
  Future<void> loadPokemons() async {
    isLoading = true;
    try {
      final result = await getPokemonsUseCase();
      pokemons.clear();
      pokemons.addAll(result);
    } catch (e) {
      errorMessage = 'Erro ao carregar Pokémons';
    } finally {
      isLoading = false;
    }
  }

  @action
  void setSearchText(String value) {
    searchText = value;
  }
}
