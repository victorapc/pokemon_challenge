import 'package:json_annotation/json_annotation.dart';

part 'pokemon_detail_model.g.dart';

@JsonSerializable()
class PokemonDetailModel {
  final int id;
  @JsonKey(name: 'base_experience')
  final int baseExperience;
  final int height;
  final int weight;
  final List<TypeModel> types;
  final SpritesModel sprites;

  PokemonDetailModel({
    required this.id,
    required this.baseExperience,
    required this.height,
    required this.weight,
    required this.types,
    required this.sprites,
  });

  factory PokemonDetailModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonDetailModelToJson(this);
}

@JsonSerializable()
class TypeModel {
  final TypeInfoModel type;

  TypeModel({required this.type});

  factory TypeModel.fromJson(Map<String, dynamic> json) =>
      _$TypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$TypeModelToJson(this);
}

@JsonSerializable()
class TypeInfoModel {
  final String name;

  TypeInfoModel({required this.name});

  factory TypeInfoModel.fromJson(Map<String, dynamic> json) =>
      _$TypeInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$TypeInfoModelToJson(this);
}

@JsonSerializable()
class SpritesModel {
  @JsonKey(name: 'front_default')
  final String? frontDefault;
  @JsonKey(name: 'back_default')
  final String? backDefault;
  @JsonKey(name: 'front_shiny')
  final String? frontShiny;
  @JsonKey(name: 'back_shiny')
  final String? backShiny;

  SpritesModel({
    this.frontDefault,
    this.backDefault,
    this.frontShiny,
    this.backShiny,
  });

  factory SpritesModel.fromJson(Map<String, dynamic> json) =>
      _$SpritesModelFromJson(json);

  Map<String, dynamic> toJson() => _$SpritesModelToJson(this);
}
