import 'package:cocktails_app/core/usecase/base_usecase.dart';
import 'package:cocktails_app/domain/entities/drinks_response_entity.dart';
import 'package:cocktails_app/domain/repositories/drinks_repository.dart';

class GetOrdinaryDrinks
    extends BaseUseCase<Future<DrinkResponseEntity>, Params> {
  final DrinkRepository repo;
  const GetOrdinaryDrinks(this.repo);

  @override
  Future<DrinkResponseEntity> execute(Params params) async {
    return await repo.getDrinks(params.url);
  }
}

class Params {
  final String url;
  const Params(this.url);
}
