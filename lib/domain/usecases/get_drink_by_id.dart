import 'package:cocktails_app/core/usecase/base_usecase.dart';
import 'package:cocktails_app/domain/entities/drink_detail_entity.dart';
import 'package:cocktails_app/domain/repositories/drinks_repository.dart';

class GetDrinkById extends BaseUseCase<Future<DrinkDetailsEntity>, Params> {
  final DrinkRepository repo;
  const GetDrinkById(this.repo);

  @override
  Future<DrinkDetailsEntity> execute(Params params) async {
    return await repo.getDrinkById(params.id);
  }
}

class Params {
  final String? id;
  const Params({
    required this.id,
  });
}
