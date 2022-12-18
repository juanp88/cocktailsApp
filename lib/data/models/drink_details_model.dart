import 'package:cocktails_app/domain/entities/drink_detail_entity.dart';

class DrinkDetails extends DrinkDetailsEntity {
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

  DrinkDetails({
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
  }) : super(
          idDrink: idDrink,
          strDrink: strDrink,
          strCategory: strCategory,
          strIba: strIba,
          strAlcoholic: strAlcoholic,
          strGlass: strGlass,
          strInstructions: strInstructions,
          strDrinkThumb: strDrinkThumb,
          strIngredient1: strIngredient1,
          strIngredient2: strIngredient2,
          strIngredient3: strIngredient3,
          strIngredient4: strIngredient4,
          strIngredient5: strIngredient5,
          strIngredient6: strIngredient6,
          strMeasure1: strMeasure1,
          strMeasure2: strMeasure2,
          strMeasure3: strMeasure3,
          strMeasure4: strMeasure4,
          strMeasure5: strMeasure5,
          strMeasure6: strMeasure6,
        );

  factory DrinkDetails.fromJson(Map<String, dynamic> json) => DrinkDetails(
        idDrink: json['idDrink'],
        strDrink: json['strDrink'],
        strCategory: json['strCategory'],
        strIba: json['strIba'],
        strAlcoholic: json['strAlcoholic'],
        strGlass: json['strGlass'],
        strInstructions: json['strInstructions'],
        strDrinkThumb: json['strDrinkThumb'],
        strIngredient1: json['strIngredient1'],
        strIngredient2: json['strIngredient2'],
        strIngredient3: json['strIngredient3'],
        strIngredient4: json['strIngredient4'],
        strIngredient5: json['strIngredient5'],
        strIngredient6: json['strIngredient6'],
        strMeasure1: json['strMeasure1'],
        strMeasure2: json['strMeasure2'],
        strMeasure3: json['strMeasure3'],
        strMeasure4: json['strMeasure4'],
        strMeasure5: json['strMeasure5'],
        strMeasure6: json['strMeasure6'],
      );

  DrinkDetailsEntity convertToEntity() {
    return DrinkDetailsEntity(
      idDrink: idDrink,
      strDrink: strDrink,
      strCategory: strCategory,
      strIba: strIba,
      strAlcoholic: strAlcoholic,
      strGlass: strGlass,
      strInstructions: strInstructions,
      strDrinkThumb: strDrinkThumb,
      strIngredient1: strIngredient1,
      strIngredient2: strIngredient2,
      strIngredient3: strIngredient3,
      strIngredient4: strIngredient4,
      strIngredient5: strIngredient5,
      strIngredient6: strIngredient6,
      strMeasure1: strMeasure1,
      strMeasure2: strMeasure2,
      strMeasure3: strMeasure3,
      strMeasure4: strMeasure4,
      strMeasure5: strMeasure5,
      strMeasure6: strMeasure6,
    );
  }
}
