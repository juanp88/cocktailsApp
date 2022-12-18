import 'package:cocktails_app/core/usecase/base_usecase.dart';
import 'package:cocktails_app/domain/entities/drinks_response_entity.dart';
import 'package:cocktails_app/domain/repositories/drinks_repository.dart';

class GetCocktails extends BaseUseCase<Future<DrinkResponseEntity>, Params> {
  final DrinkRepository repo;
  const GetCocktails(this.repo);

  @override
  Future<DrinkResponseEntity> execute(Params params) async {
    return await repo.getDrinks(params.url);
  }

  getDrinks(String? url) {}
}

class Params {
  final String url;
  const Params(this.url);
}
