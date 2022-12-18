import 'package:cocktails_app/domain/entities/drink_detail_entity.dart';
import 'package:cocktails_app/domain/entities/drink_entity.dart';
import 'package:cocktails_app/presentation/controllers/ordinary_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GridViewList extends ConsumerWidget {
  final List<DrinkEntity> drinksList;
  const GridViewList(this.drinksList, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemCount: drinksList.length,
        itemBuilder: (BuildContext ctx, index) {
          DrinkEntity drink = drinksList[index];
          return GestureDetector(
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => UniversityDetails(
              //             country: university.country!,
              //             name: university.name!,
              //             state: university.stateProvince!,
              //             webPage: university.webPages!.first)));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(15)),
                child: Text(drink.strDrink),
              ),
            ),
          );
        });
  }
}
