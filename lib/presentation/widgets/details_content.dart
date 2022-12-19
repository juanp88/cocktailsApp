import 'package:flutter/material.dart';

import '../../config/app_constants.dart';
import '../../domain/entities/drink_detail_entity.dart';

class DetailsContent extends StatelessWidget {
  DetailsContent({Key? key, required this.data}) : super(key: key);
  final DrinkDetailsEntity data;

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    var deviceRatio = MediaQuery.of(context).devicePixelRatio;
    return Scaffold(
      backgroundColor: primary,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Image.network(
                  data.strDrinkThumb ?? '',
                  fit: BoxFit.fitHeight,
                ),
              ],
            ),
            Positioned(
              bottom: deviceRatio * 1,
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [primary, accent, primary],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                    color: primary,
                    borderRadius: BorderRadius.circular(25)),
                width: screensize.width,
                height: screensize.height / 2.2,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        data.strDrink.toString(),
                        style: title,
                      ),
                      Divider(
                        color: Colors.white.withOpacity(0.5),
                        thickness: 1,
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            data.strCategory ?? '',
                            style: title,
                          ),
                          Text(
                            data.strAlcoholic ?? '',
                            style: title,
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.white.withOpacity(0.5),
                        thickness: 1,
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            data.strInstructions ?? '',
                            style: smallcontent,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  data.strGlass ?? '',
                                  style: smallcontent,
                                ),
                                Icon(
                                  Icons.wine_bar_outlined,
                                  color: Colors.white.withOpacity(0.5),
                                )
                              ]),
                        ],
                      ),
                      Divider(
                        color: Colors.white.withOpacity(0.5),
                        thickness: 1,
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Ingredient",
                            style: title,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            data.strIngredient1 ?? '',
                            style: smallcontent,
                          ),
                          Text(
                            data.strMeasure1 ?? '',
                            style: smallcontent,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            data.strIngredient2 ?? '',
                            style: smallcontent,
                          ),
                          Text(
                            data.strMeasure2 ?? '',
                            style: smallcontent,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            data.strIngredient3 ?? '',
                            style: smallcontent,
                          ),
                          Text(
                            data.strMeasure3 ?? '',
                            style: smallcontent,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            data.strIngredient4 ?? '',
                            style: smallcontent,
                          ),
                          Text(
                            data.strMeasure4 ?? '',
                            style: smallcontent,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            data.strIngredient5 ?? '',
                            style: smallcontent,
                          ),
                          Text(
                            data.strMeasure5 ?? '',
                            style: smallcontent,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            data.strIngredient6 ?? '',
                            style: smallcontent,
                          ),
                          Text(
                            data.strMeasure6 ?? '',
                            style: smallcontent,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
