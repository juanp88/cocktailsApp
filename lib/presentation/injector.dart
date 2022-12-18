import 'package:cocktails_app/data/repositories/drink_repository_impl.dart';
import 'package:cocktails_app/domain/repositories/drinks_repository.dart';
import 'package:cocktails_app/domain/usecases/get_cocktails.dart';
import 'package:cocktails_app/domain/usecases/get_drink_by_id.dart';

import '../data/datasource/remote_datasource/remote_datasource.dart';
import 'package:http/http.dart' as http;

class Injector {
  static RemoteDataSource remoteDataSource = RemoteDataSource(http.Client());
  static DrinkRepository drinkRepository =
      DrinksRepositoryImpl(dataSource: remoteDataSource);
  static GetCocktails getCocktailsUseCase = GetCocktails(drinkRepository);
  static GetDrinkById getDrinkByIdUseCase = GetDrinkById(drinkRepository);
}
