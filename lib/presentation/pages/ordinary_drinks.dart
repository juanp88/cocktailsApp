import 'package:cocktails_app/config/api_constants.dart';
import 'package:cocktails_app/presentation/widgets/grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/drink_entity.dart';
import '../controllers/ordinary_controller.dart';

final drinkListFutureProvider =
    FutureProvider.autoDispose<List<DrinkEntity>>((ref) async {
  final listControllerProvider = ref.watch(ordinaryDrinksControllerProvider);
  return listControllerProvider.getDrinks(ApiConstants.ordinaryEndpoint);
});

class OrdinaryPage extends ConsumerStatefulWidget {
  const OrdinaryPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OrdinaryPageState();
}

class _OrdinaryPageState extends ConsumerState<OrdinaryPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final drinkListRef = ref.watch(drinkListFutureProvider);
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
