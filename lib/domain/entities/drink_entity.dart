import 'package:equatable/equatable.dart';

class DrinkEntity extends Equatable {
  const DrinkEntity({
    required this.strDrink,
    required this.strDrinkThumb,
    required this.idDrink,
  });
  final String strDrink;
  final String strDrinkThumb;
  final String idDrink;

  @override
  List<Object?> get props => [strDrink, idDrink];
}
