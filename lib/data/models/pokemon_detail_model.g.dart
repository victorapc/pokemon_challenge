// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonDetailModel _$PokemonDetailModelFromJson(Map<String, dynamic> json) =>
    PokemonDetailModel(
      id: (json['id'] as num).toInt(),
      baseExperience: (json['base_experience'] as num).toInt(),
      height: (json['height'] as num).toInt(),
      weight: (json['weight'] as num).toInt(),
      types: (json['types'] as List<dynamic>)
          .map((e) => TypeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      sprites: SpritesModel.fromJson(json['sprites'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonDetailModelToJson(PokemonDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'base_experience': instance.baseExperience,
      'height': instance.height,
      'weight': instance.weight,
      'types': instance.types,
      'sprites': instance.sprites,
    };

TypeModel _$TypeModelFromJson(Map<String, dynamic> json) => TypeModel(
      type: TypeInfoModel.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TypeModelToJson(TypeModel instance) => <String, dynamic>{
      'type': instance.type,
    };

TypeInfoModel _$TypeInfoModelFromJson(Map<String, dynamic> json) =>
    TypeInfoModel(
      name: json['name'] as String,
    );

Map<String, dynamic> _$TypeInfoModelToJson(TypeInfoModel instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

SpritesModel _$SpritesModelFromJson(Map<String, dynamic> json) => SpritesModel(
      frontDefault: json['front_default'] as String?,
      backDefault: json['back_default'] as String?,
      frontShiny: json['front_shiny'] as String?,
      backShiny: json['back_shiny'] as String?,
    );

Map<String, dynamic> _$SpritesModelToJson(SpritesModel instance) =>
    <String, dynamic>{
      'front_default': instance.frontDefault,
      'back_default': instance.backDefault,
      'front_shiny': instance.frontShiny,
      'back_shiny': instance.backShiny,
    };
