
import 'package:flutter_cat_fact_app/core/common/api_result.dart';
import 'package:flutter_cat_fact_app/core/domain/repository.dart';
import 'package:flutter_cat_fact_app/core/entity/cat_facts_entity.dart';

class RepositoryImpl implements Repository {


  @override
  Future<ApiResult<CatFactsEntity>> getCatFacts() async {
    throw UnimplementedError();
  }

}