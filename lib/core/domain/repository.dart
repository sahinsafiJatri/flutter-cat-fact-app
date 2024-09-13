import 'package:flutter_cat_fact_app/core/common/api_result.dart';
import 'package:flutter_cat_fact_app/core/entity/cat_facts_entity.dart';

abstract class Repository {

  Future<ApiResult<CatFactsEntity>> getCatFacts();
}