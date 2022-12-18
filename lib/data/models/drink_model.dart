import 'package:cocktails_app/domain/entities/drink_entity.dart';

class DrinkModel extends DrinkEntity {
  final String strDrink;
  final String strDrinkThumb;
  final String idDrink;

  const DrinkModel({
    required this.strDrink,
    required this.strDrinkThumb,
    required this.idDrink,
  }) : super(
          idDrink: idDrink,
          strDrink: strDrink,
          strDrinkThumb: strDrinkThumb,
        );

  factory DrinkModel.fromJson(Map<String, dynamic> json) => DrinkModel(
        strDrink: json['strDrink'],
        strDrinkThumb: json['strDrinkThumb'],
        idDrink: json['idDrink'],
      );

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['strDrink'] = strDrink;
    _data['strDrinkThumb'] = strDrinkThumb;
    _data['idDrink'] = idDrink;
    return _data;
  }
}
