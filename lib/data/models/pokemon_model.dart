import 'package:json_annotation/json_annotation.dart';
import 'package:pokemon_challenge/domain/entities/pokemon.dart';

part 'pokemon_model.g.dart';

@JsonSerializable()
class PokemonModel extends Pokemon {
  PokemonModel({required String name, required String url})
      : super(name: name, url: url);

  factory PokemonModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonModelFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonModelToJson(this);
}
