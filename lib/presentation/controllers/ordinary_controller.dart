import 'package:cocktails_app/domain/entities/drink_detail_entity.dart';
import 'package:cocktails_app/domain/entities/drink_entity.dart';
import 'package:cocktails_app/domain/entities/drinks_response_entity.dart';
import 'package:cocktails_app/domain/usecases/get_cocktails.dart'
    as get_cocktails;
import 'package:cocktails_app/domain/usecases/get_drink_by_id.dart'
    as get_drink_by_id;
import 'package:cocktails_app/presentation/injector.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loaderStateProvider = StateProvider<bool>((ref) => false);
final drinksListProvider = StateProvider<List<DrinkDetailsEntity>>((ref) => []);
final ordinaryListProvider =
    StateProvider<List<DrinkDetailsEntity>>((ref) => []);

final OrdinaryDrinksControllerProvider =
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

  Future<List<DrinkDetailsEntity>> getOrdinaryDrinks(String endpoint) async {
    ref.read(loaderStateProvider.notifier).state = true;

    List<DrinkDetailsEntity> ordinaryDrinksList = [];

    try {
      responseEntity =
          await getCocktailsUsecase.execute(get_cocktails.Params(endpoint));

      for (DrinkEntity drink in responseEntity!.drinks) {
        DrinkDetailsEntity detail = await getDrinkById(drink.idDrink);
        ordinaryDrinksList.add(detail);
      }

      ref.read(ordinaryListProvider.notifier).state = ordinaryDrinksList;
/* 
      for (DrinkEntity drink in responseEntity!.drinks) {
        DrinkDetailsEntity detail = await getDrinkById(drink.idDrink);
        ordinaryDrinksDetailList.add(detail);
      }
      List<DrinkDetailsEntity> oldList = [
        ...ref.read(drinksListProvider.notifier).state
      ];

      ref.read(drinksListProvider.notifier).state = oldList
        ..addAll(ordinaryDrinksDetailList);
      ref.read(loaderStateProvider.notifier).state = false; */
      return ordinaryDrinksList;
    } catch (e) {
      ref.read(loaderStateProvider.notifier).state = false;
      rethrow;
    }
  }

  Future<DrinkDetailsEntity> getDrinkById(String id) async {
    return getDrinkByIdUsecase.execute(get_drink_by_id.Params(id: id));
  }
}
