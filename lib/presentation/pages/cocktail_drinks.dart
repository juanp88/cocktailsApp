import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CocktailsPage extends ConsumerStatefulWidget {
  const CocktailsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CocktailsPageState();
}

class _CocktailsPageState extends ConsumerState<CocktailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cocktail drinks'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
    );
  }
}
