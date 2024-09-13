import 'package:flutter_cat_fact_app/core/common/api_result.dart';
import 'package:flutter_cat_fact_app/core/domain/base/base_usecase.dart';
import 'package:flutter_cat_fact_app/core/domain/repository.dart';
import 'package:flutter_cat_fact_app/core/entity/cat_facts_entity.dart';

class GetCatFactApiUseCase extends UseCase<CatFactsEntity, void> {

  final Repository _repository;

  GetCatFactApiUseCase(this._repository);

  @override
  Future<ApiResult<CatFactsEntity>> execute({void params}) {
    return _repository.getCatFacts();
  }

}