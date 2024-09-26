// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PokemonStore on _PokemonStoreBase, Store {
  Computed<List<Pokemon>>? _$filteredPokemonsComputed;

  @override
  List<Pokemon> get filteredPokemons => (_$filteredPokemonsComputed ??=
          Computed<List<Pokemon>>(() => super.filteredPokemons,
              name: '_PokemonStoreBase.filteredPokemons'))
      .value;

  late final _$pokemonsAtom =
      Atom(name: '_PokemonStoreBase.pokemons', context: context);

  @override
  ObservableList<Pokemon> get pokemons {
    _$pokemonsAtom.reportRead();
    return super.pokemons;
  }

  @override
  set pokemons(ObservableList<Pokemon> value) {
    _$pokemonsAtom.reportWrite(value, super.pokemons, () {
      super.pokemons = value;
    });
  }

  late final _$searchTextAtom =
      Atom(name: '_PokemonStoreBase.searchText', context: context);

  @override
  String get searchText {
    _$searchTextAtom.reportRead();
    return super.searchText;
  }

  @override
  set searchText(String value) {
    _$searchTextAtom.reportWrite(value, super.searchText, () {
      super.searchText = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_PokemonStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$loadPokemonsAsyncAction =
      AsyncAction('_PokemonStoreBase.loadPokemons', context: context);

  @override
  Future<void> loadPokemons() {
    return _$loadPokemonsAsyncAction.run(() => super.loadPokemons());
  }

  late final _$_PokemonStoreBaseActionController =
      ActionController(name: '_PokemonStoreBase', context: context);

  @override
  void setSearchText(String value) {
    final _$actionInfo = _$_PokemonStoreBaseActionController.startAction(
        name: '_PokemonStoreBase.setSearchText');
    try {
      return super.setSearchText(value);
    } finally {
      _$_PokemonStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pokemons: ${pokemons},
searchText: ${searchText},
isLoading: ${isLoading},
filteredPokemons: ${filteredPokemons}
    ''';
  }
}
