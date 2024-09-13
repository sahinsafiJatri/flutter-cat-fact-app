import 'package:flutter_cat_fact_app/core/common/api_result.dart';

abstract class UseCase<Type,Params> {
  Future<ApiResult<Type>> execute({Params params});
}