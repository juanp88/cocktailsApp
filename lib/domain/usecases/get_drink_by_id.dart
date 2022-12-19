import 'package:cocktails_app/core/usecase/base_usecase.dart';
import 'package:cocktails_app/domain/repositories/drinks_repository.dart';
import '../entities/details_response_entity.dart';

class GetDrinkById extends BaseUseCase<Future<DetailsResponseEntity>, Params> {
  final DrinkRepository repo;
  const GetDrinkById(this.repo);

  @override
  Future<DetailsResponseEntity> execute(Params params) async {
    return await repo.getDrinkById(params.id);
  }
}

class Params {
  final String? id;
  const Params({
    required this.id,
  });
}
