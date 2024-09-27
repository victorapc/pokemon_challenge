import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokemon_challenge/presentation/widgets/custom_appbar.dart';
import '../../stores/battery_store.dart';
import '../../stores/pokemon_store.dart';
import '../../../injection_container.dart';
import '../detail/pokemon_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PokemonStore store = getIt<PokemonStore>();
  final BatteryStore batteryStore = getIt<BatteryStore>();

  @override
  void initState() {
    super.initState();
    store.loadPokemons();
    batteryStore.loadBatteryLevel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppbar(
        title: 'Pokédex',
      ),
      body: Column(
        children: [
          // Texto do nível de bateria no topo
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Observer(
              builder: (_) => Text(
                batteryStore.batteryLevelText,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                // Campo de busca
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: store.setSearchText,
                    decoration: const InputDecoration(
                      labelText: 'Buscar Pokémon',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                // GridView com Pokémons
                Expanded(
                  child: Observer(
                    builder: (_) {
                      if (store.isLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (store.filteredPokemons.isEmpty) {
                        return const Center(
                          child: Text(
                            'Nenhum Pokémon encontrado.',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        );
                      }

                      return GridView.builder(
                        padding: const EdgeInsets.all(8.0),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                          childAspectRatio: 0.8,
                        ),
                        itemCount: store.filteredPokemons.length,
                        itemBuilder: (context, index) {
                          final pokemon = store.filteredPokemons[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PokemonDetailPage(
                                    pokemonObj: pokemon,
                                  ),
                                ),
                              );
                            },
                            child: Card(
                              color: Colors.red[700],
                              elevation: 3.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    pokemon.name.toUpperCase(),
                                    style: const TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  const SizedBox(height: 8.0),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
