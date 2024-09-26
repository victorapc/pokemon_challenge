import 'package:flutter/material.dart';

import '../../widgets/custom_appbar.dart';

class PokemonDetailPage extends StatelessWidget {
  final String title;

  const PokemonDetailPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: title,
      ),
      body: Container(),
    );
  }
}
