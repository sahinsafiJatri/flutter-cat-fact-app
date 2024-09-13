
import 'dart:convert';

import 'package:flutter_cat_fact_app/core/common/api_result.dart';
import 'package:flutter_cat_fact_app/core/data/api_services.dart';
import 'package:flutter_cat_fact_app/core/data/network_bound_resource.dart';
import 'package:flutter_cat_fact_app/core/domain/repository.dart';
import 'package:flutter_cat_fact_app/core/entity/cat_facts_entity.dart';

class RepositoryImpl implements Repository {

  final ApiServices _apiServices;
  final NetworkBoundResource _boundResource;

  RepositoryImpl(this._apiServices, this._boundResource);

  @override
  Future<ApiResult<List<CatFactsEntity>>> getCatFacts() async {

    final result = await _boundResource.downloadData(()=>_apiServices.fetchCatFactsApi());

    switch(result) {
      case ApiSuccess() : {
        final body = json.decode(result.data) as List;
        final catFactsEntityList = body.map((dynamic json) {
          return CatFactsEntity.fromJson(json);
        }).toList();
        return ApiSuccess(catFactsEntityList);
      }
      case ApiError() : {
        return ApiError(result.errorCode, result.errorMessage);
      }
    }

  }

}