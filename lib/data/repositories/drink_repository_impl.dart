import 'package:cocktails_app/data/datasource/remote_datasource/remote_datasource.dart';
import 'package:cocktails_app/data/models/drinks_response_model.dart';
import 'package:cocktails_app/domain/entities/details_response_entity.dart';
import 'package:cocktails_app/domain/entities/drink_entity.dart';
import 'package:cocktails_app/domain/entities/drinks_response_entity.dart';
import 'package:cocktails_app/domain/entities/drink_detail_entity.dart';
import 'package:cocktails_app/domain/repositories/drinks_repository.dart';

import '../models/details_response_model.dart';

class DrinksRepositoryImpl implements DrinkRepository {
  final RemoteDataSource dataSource;
  const DrinksRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<DetailsResponseEntity> getDrinkById(String? id) async {
    DetailsResponseModel responseModel;

    try {
      responseModel = await dataSource.getDrinksById(id);

      DetailsResponseEntity ent = DetailsResponseEntity(
          drinks: responseModel.drinks
              .map((e) => DrinkDetailsEntity(
                    idDrink: e.idDrink,
                    strDrink: e.strDrink,
                    strCategory: e.strCategory,
                    strIba: e.strIba,
                    strAlcoholic: e.strAlcoholic,
                    strGlass: e.strGlass,
                    strInstructions: e.strInstructions,
                    strDrinkThumb: e.strDrinkThumb,
                    strIngredient1: e.strIngredient1,
                    strIngredient2: e.strIngredient2,
                    strIngredient3: e.strIngredient3,
                    strIngredient4: e.strIngredient4,
                    strIngredient5: e.strIngredient5,
                    strIngredient6: e.strIngredient6,
                    strMeasure1: e.strMeasure1,
                    strMeasure2: e.strMeasure2,
                    strMeasure3: e.strMeasure3,
                    strMeasure4: e.strMeasure4,
                    strMeasure5: e.strMeasure5,
                    strMeasure6: e.strMeasure6,
                  ))
              .toList());
      return ent;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<DrinkResponseEntity> getDrinks(String endpoint) async {
    try {
      DrinksResponseModel responseModel = await dataSource.getDrinks(endpoint);
      return DrinkResponseEntity(
        drinks: responseModel.drinks
            .map((e) => DrinkEntity(
                strDrink: e.strDrink,
                strDrinkThumb: e.strDrinkThumb,
                idDrink: e.idDrink))
            .toList(),
      );
    } catch (e) {
      throw Exception();
    }
  }
}
