import 'package:cocktails_app/domain/entities/drinks_response_entity.dart';

import 'drink_model.dart';

class DrinksResponseModel extends DrinkResponseEntity {
  const DrinksResponseModel({
    required this.drinks,
  }) : super(drinks: drinks);

  final List<DrinkModel> drinks;

  factory DrinksResponseModel.fromJson(Map<String, dynamic> json) =>
      DrinksResponseModel(
          drinks: List.from(json['drinks'])
              .map((e) => DrinkModel.fromJson(e))
              .toList());

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['drinks'] = drinks.map((e) => e.toJson()).toList();
    return _data;
  }
}
