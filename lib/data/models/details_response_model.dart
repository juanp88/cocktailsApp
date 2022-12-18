import 'package:cocktails_app/data/models/drink_details_model.dart';
import 'package:cocktails_app/domain/entities/details_response_entity.dart';

class DetailsResponseModel extends DetailsResponseEntity {
  const DetailsResponseModel({
    required this.drinks,
  }) : super(drinks: drinks);

  final List<DrinkDetails> drinks;

  factory DetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      DetailsResponseModel(
          drinks: List.from(json['drinks'])
              .map((e) => DrinkDetails.fromJson(e))
              .toList());

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['drinks'] = drinks.map((e) => e.toJson()).toList();
    return _data;
  }
}
