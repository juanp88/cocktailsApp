import 'package:equatable/equatable.dart';

class DrinkDetailsEntity extends Equatable {
  DrinkDetailsEntity({
    required this.idDrink,
    required this.strDrink,
    required this.strCategory,
    required this.strIba,
    required this.strAlcoholic,
    required this.strGlass,
    required this.strInstructions,
    required this.strDrinkThumb,
    required this.strIngredient1,
    required this.strIngredient2,
    required this.strIngredient3,
    required this.strIngredient4,
    required this.strIngredient5,
    required this.strIngredient6,
    required this.strMeasure1,
    required this.strMeasure2,
    required this.strMeasure3,
    required this.strMeasure4,
    required this.strMeasure5,
    required this.strMeasure6,
  });

  final String? idDrink;
  final String? strDrink;
  final String? strCategory;
  final String? strIba;
  final String? strAlcoholic;
  final String? strGlass;
  final String? strInstructions;
  final String? strDrinkThumb;
  final String? strIngredient1;
  final String? strIngredient2;
  final String? strIngredient3;
  final String? strIngredient4;
  final String? strIngredient5;
  final String? strIngredient6;
  final String? strMeasure1;
  final String? strMeasure2;
  final String? strMeasure3;
  final String? strMeasure4;
  final String? strMeasure5;
  final String? strMeasure6;

  @override
  List<Object?> get props => [idDrink, strDrink];
}
