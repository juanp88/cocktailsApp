import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'presentation/routes.dart';

void main() {
  runApp(ProviderScope(
    child: DrinksApp(),
  ));
}

class DrinksApp extends StatelessWidget {
  const DrinksApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drinks App',
      initialRoute: '/home',
      routes: generateRoutes(context),
    );
  }
}
