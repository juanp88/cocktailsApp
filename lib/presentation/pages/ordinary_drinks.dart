import 'package:cocktails_app/config/api_constants.dart';
import 'package:cocktails_app/presentation/widgets/grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/drink_detail_entity.dart';
import '../controllers/ordinary_controller.dart';

class OrdinaryPage extends ConsumerStatefulWidget {
  const OrdinaryPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OrdinaryPageState();
}

class _OrdinaryPageState extends ConsumerState<OrdinaryPage> {
  Future<void> _getData() async {
    await ref
        .watch(OrdinaryDrinksControllerProvider)
        .getOrdinaryDrinks(ApiConstants.ordinaryEndpoint);
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      this._getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    var list = ref.watch(drinksListProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Ordinary drinks'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      // body: GridViewList(),
    );
  }
}
