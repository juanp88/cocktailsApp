import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../config/api_constants.dart';
import '../../domain/entities/drink_entity.dart';
import '../controllers/ordinary_controller.dart';
import '../widgets/grid_view.dart';

final drinkListFutureProvider =
    FutureProvider.family.autoDispose((ref, query) async {
  final listControllerProvider = ref.watch(ordinaryDrinksControllerProvider);
  return listControllerProvider
      .getDrinks(ApiConstants.searchEndpoint + '$query');
});

class SearchResultPage extends ConsumerStatefulWidget {
  const SearchResultPage(this.query, {super.key});
  final String query;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SearchResultPageState();
}

class _SearchResultPageState extends ConsumerState<SearchResultPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final drinkListRef = ref.watch(drinkListFutureProvider(widget.query));
    return Scaffold(
        appBar: AppBar(
          title: Text('Ordinary drinks'),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Center(
          child: drinkListRef.when(data: (data) {
            return Column(
              children: [
                Expanded(child: GridViewList(data)),
              ],
            );
          }, error: (error, _) {
            return Center(
              child: Text('Error'),
            );
          }, loading: () {
            return const CircularProgressIndicator();
          }),
        ));
  }
}
