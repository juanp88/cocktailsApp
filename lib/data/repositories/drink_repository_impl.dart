import 'package:cocktails_app/data/datasource/remote_datasource/remote_datasource.dart';
import 'package:cocktails_app/data/models/drink_details_model.dart';
import 'package:cocktails_app/data/models/drinks_response_model.dart';
import 'package:cocktails_app/domain/entities/drink_entity.dart';
import 'package:cocktails_app/domain/entities/drinks_response_entity.dart';
import 'package:cocktails_app/domain/entities/drink_detail_entity.dart';
import 'package:cocktails_app/domain/repositories/drinks_repository.dart';

class DrinksRepositoryImpl implements DrinkRepository {
  final RemoteDataSource dataSource;
  const DrinksRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<DrinkDetailsEntity> getDrinkById(String? id) async {
    DrinkDetails drinkModel;
    try {
      drinkModel = await dataSource.getDrinksById(id);
      return drinkModel.convertToEntity();
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
