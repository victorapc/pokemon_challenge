// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PokemonDetailStore on _PokemonDetailStoreBase, Store {
  late final _$pokemonDetailAtom =
      Atom(name: '_PokemonDetailStoreBase.pokemonDetail', context: context);

  @override
  PokemonDetail? get pokemonDetail {
    _$pokemonDetailAtom.reportRead();
    return super.pokemonDetail;
  }

  @override
  set pokemonDetail(PokemonDetail? value) {
    _$pokemonDetailAtom.reportWrite(value, super.pokemonDetail, () {
      super.pokemonDetail = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_PokemonDetailStoreBase.isLoading', context: context);

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

  late final _$errorMessageAtom =
      Atom(name: '_PokemonDetailStoreBase.errorMessage', context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$loadPokemonDetailAsyncAction = AsyncAction(
      '_PokemonDetailStoreBase.loadPokemonDetail',
      context: context);

  @override
  Future<void> loadPokemonDetail(int id) {
    return _$loadPokemonDetailAsyncAction
        .run(() => super.loadPokemonDetail(id));
  }

  @override
  String toString() {
    return '''
pokemonDetail: ${pokemonDetail},
isLoading: ${isLoading},
errorMessage: ${errorMessage}
    ''';
  }
}
