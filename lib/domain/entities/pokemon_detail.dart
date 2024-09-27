import 'package:equatable/equatable.dart';

class PokemonDetail extends Equatable {
  final int id;
  final int baseExperience;
  final int height;
  final int weight;
  final List<String> types;
  final List<String> sprites;

  const PokemonDetail({
    required this.id,
    required this.baseExperience,
    required this.height,
    required this.weight,
    required this.types,
    required this.sprites,
  });

  @override
  List<Object?> get props =>
      [id, baseExperience, height, weight, types, sprites];
}
