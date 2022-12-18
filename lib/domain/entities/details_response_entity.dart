import 'package:cocktails_app/domain/entities/drink_detail_entity.dart';
import 'package:cocktails_app/domain/entities/drink_entity.dart';
import 'package:equatable/equatable.dart';

class DetailsResponseEntity extends Equatable {
  const DetailsResponseEntity({required this.drinks});
  final List<DrinkDetailsEntity> drinks;

  @override
  List<Object?> get props => [drinks];
}
