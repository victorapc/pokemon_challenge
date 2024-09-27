import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokemon_challenge/core/utils/functions_utils.dart';
import 'package:pokemon_challenge/domain/entities/pokemon.dart';
import 'package:pokemon_challenge/injection_container.dart';

import '../../stores/pokemon_detail_store.dart';
import '../../widgets/custom_appbar.dart';

class PokemonDetailPage extends StatefulWidget {
  final Pokemon pokemonObj;

  const PokemonDetailPage({super.key, required this.pokemonObj});

  @override
  State<PokemonDetailPage> createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  final PokemonDetailStore store = getIt<PokemonDetailStore>();
  int id = 0;

  @override
  void initState() {
    super.initState();
    String url = widget.pokemonObj.url;
    int pokemonId = FunctionsUtils.extractIdFromUrl(url);
    id = pokemonId;
    store.loadPokemonDetail(pokemonId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: widget.pokemonObj.name.toUpperCase(),
      ),
      body: Observer(
        builder: (_) {
          if (store.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (store.errorMessage.isNotEmpty) {
            return Center(child: Text(store.errorMessage));
          }

          if (store.pokemonDetail == null) {
            return const Center(
              child: Text('Detalhes não disponíveis'),
            );
          }

          final pokemon = store.pokemonDetail!;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Exibir os sprites em um GridView
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  physics: const NeverScrollableScrollPhysics(),
                  children: pokemon.sprites.map((spriteUrl) {
                    return Image.network(
                      spriteUrl,
                      fit: BoxFit.contain,
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16.0),
                // Exibir os dados
                ListTile(
                  title: const Text('ID'),
                  trailing: Text(pokemon.id.toString()),
                ),
                const Divider(),
                ListTile(
                  title: const Text('Experiência Base'),
                  trailing: Text(pokemon.baseExperience.toString()),
                ),
                const Divider(),
                ListTile(
                  title: const Text('Altura'),
                  trailing: Text('${pokemon.height / 10} m'),
                ),
                const Divider(),
                ListTile(
                  title: const Text('Peso'),
                  trailing: Text('${pokemon.weight / 10} kg'),
                ),
                const Divider(),
                ListTile(
                  title: const Text('Tipos'),
                  trailing: Text(pokemon.types.join(', ').toUpperCase()),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
