import 'dart:math';

import 'package:cocktails_app/presentation/widgets/details_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/details_response_entity.dart';
import '../../domain/entities/drink_detail_entity.dart';
import '../controllers/ordinary_controller.dart';

final detailsFutureProvider = FutureProvider.family
    .autoDispose<DrinkDetailsEntity, String>((ref, id) async {
  final listControllerProvider = ref.watch(ordinaryDrinksControllerProvider);
  return listControllerProvider.getDrinkById(id);
});

class DetailsPage extends ConsumerStatefulWidget {
  final String drinkId;
  const DetailsPage(this.drinkId, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DetailsPageState();
}

class _DetailsPageState extends ConsumerState<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final detailsRef = ref.watch(detailsFutureProvider(widget.drinkId));
    return Scaffold(
      body: Center(
          child: detailsRef.when(
              data: (data) => DetailsContent(data: data),
              error: (error, _) {
                return Center(
                  child: Text('Error'),
                );
              },
              loading: (() => const CircularProgressIndicator()))),
    );
  }
}
