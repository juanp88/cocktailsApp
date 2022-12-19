import 'package:cocktails_app/config/app_constants.dart';
import 'package:cocktails_app/presentation/widgets/category_widget.dart';
import 'package:cocktails_app/presentation/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drinks APP'),
      ),
      backgroundColor: primary,
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SearchBar(),
              ],
            ),
          ),
          Expanded(
              child: Center(
            child: Text(
              'Choose your type',
              style: titleWhite,
            ),
          )),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CategoryWidget('Ordinary', '/ordinary'),
                CategoryWidget('Cocktails', '/cocktails'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
