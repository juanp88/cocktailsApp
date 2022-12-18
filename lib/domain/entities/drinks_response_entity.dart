import 'package:cocktails_app/domain/entities/drink_entity.dart';
import 'package:equatable/equatable.dart';

class DrinkResponseEntity extends Equatable {
  const DrinkResponseEntity({required this.drinks});
  final List<DrinkEntity> drinks;

  @override
  List<Object?> get props => [drinks];
}
