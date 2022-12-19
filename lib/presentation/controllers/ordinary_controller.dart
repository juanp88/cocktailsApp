import 'package:cocktails_app/domain/entities/drink_detail_entity.dart';
import 'package:cocktails_app/domain/entities/drink_entity.dart';
import 'package:cocktails_app/domain/entities/drinks_response_entity.dart';
import 'package:cocktails_app/domain/usecases/get_cocktails.dart'
    as get_cocktails;
import 'package:cocktails_app/domain/usecases/get_drink_by_id.dart'
    as get_drink_by_id;
import 'package:cocktails_app/presentation/injector.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/details_response_entity.dart';

final loaderStateProvider = StateProvider<bool>((ref) => false);
final drinksListProvider = StateProvider<List<DrinkEntity>>((ref) => []);
final ordinaryListProvider =
    StateProvider<List<DrinkDetailsEntity>>((ref) => []);
final ordinaryDetailsList =
    StateProvider<List<DrinkDetailsEntity>>((ref) => []);

final ordinaryDrinksControllerProvider =
    Provider.autoDispose<OrdinaryDrinksController>(
        (ref) => OrdinaryDrinksController(
              ref,
              getCocktailsUsecase: Injector.getCocktailsUseCase,
              getDrinkByIdUsecase: Injector.getDrinkByIdUseCase,
            ));

class OrdinaryDrinksController {
  late ProviderRef ref;
  late get_cocktails.GetCocktails getCocktailsUsecase;
  late get_drink_by_id.GetDrinkById getDrinkByIdUsecase;

  static final OrdinaryDrinksController _singleton =
      OrdinaryDrinksController._internal();

  factory OrdinaryDrinksController(
    ProviderRef reference, {
    required get_cocktails.GetCocktails getCocktailsUsecase,
    required get_drink_by_id.GetDrinkById getDrinkByIdUsecase,
  }) {
    _singleton.ref = reference;
    _singleton.getCocktailsUsecase = getCocktailsUsecase;
    _singleton.getDrinkByIdUsecase = getDrinkByIdUsecase;
    return _singleton;
  }

  OrdinaryDrinksController._internal();

  DrinkResponseEntity? responseEntity;

  Future<List<DrinkEntity>> getDrinks(String endpoint) async {
    List<DrinkEntity> drinkList = [];

    if (drinkList.isEmpty) {
      try {
        responseEntity =
            await getCocktailsUsecase.execute(get_cocktails.Params(endpoint));

        for (DrinkEntity drink in responseEntity!.drinks) {
          drinkList.add(drink);
        }

        ref.read(drinksListProvider.notifier).state = [
          ...ref.read(drinksListProvider.notifier).state
        ]..addAll(drinkList);
        return drinkList;
      } catch (e) {
        ref.read(loaderStateProvider.notifier).state = false;
        rethrow;
      }
    } else {
      return drinkList;
    }
  }

  Future<DrinkDetailsEntity> getDrinkById(String id) async {
    DetailsResponseEntity detailResponse =
        await getDrinkByIdUsecase.execute(get_drink_by_id.Params(id: id));
    ref.read(ordinaryDetailsList.notifier).state = [
      ...ref.read(ordinaryDetailsList.notifier).state
    ]..add(detailResponse.drinks[0]);
    return detailResponse.drinks[0];
  }
}
