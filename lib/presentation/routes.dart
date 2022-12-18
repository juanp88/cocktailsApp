import 'package:cocktails_app/presentation/pages/cocktail_drinks.dart';
import 'package:cocktails_app/presentation/pages/ordinary_drinks.dart';
import 'package:flutter/material.dart';

import 'pages/home.dart';

Map<String, WidgetBuilder> generateRoutes(BuildContext context) {
  return {
    '/home': (context) => Home(),
    '/cocktails': (context) => CocktailsPage(),
    '/ordinary': (context) => OrdinaryPage(),
  };
}
