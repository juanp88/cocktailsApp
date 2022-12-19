import 'dart:ui';

import 'package:bordered_text/bordered_text.dart';
import 'package:cocktails_app/domain/entities/drink_detail_entity.dart';
import 'package:cocktails_app/domain/entities/drink_entity.dart';
import 'package:cocktails_app/presentation/controllers/ordinary_controller.dart';
import 'package:cocktails_app/presentation/pages/details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GridViewList extends StatelessWidget {
  final List<DrinkEntity> drinksList;
  const GridViewList(this.drinksList, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 3,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: drinksList.length,
          itemBuilder: (BuildContext ctx, index) {
            DrinkEntity drink = drinksList[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailsPage(drink.idDrink)));
              },
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(drink.strDrinkThumb),
                  ClipRect(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BackdropFilter(
                        filter: new ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                        child: Container(
                            alignment: Alignment.center,
                            child: BorderedText(
                              strokeWidth: 2,
                              strokeColor: Colors.black,
                              child: Text(
                                drink.strDrink,
                                style: TextStyle(
                                    //letterSpacing: 2,
                                    fontSize: 28,
                                    color: Colors.white),
                              ),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
