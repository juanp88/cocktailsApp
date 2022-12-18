import 'package:cocktails_app/domain/entities/drink_detail_entity.dart';
import 'package:cocktails_app/domain/entities/drinks_response_entity.dart';

abstract class DrinkRepository {
  Future<DrinkResponseEntity> getDrinks(String endpoint);
  Future<DrinkDetailsEntity> getDrinkById(String? id);
}
