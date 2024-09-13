import 'package:flutter_cat_fact_app/core/data/api_services.dart';
import 'package:flutter_cat_fact_app/core/data/network_bound_resource.dart';
import 'package:flutter_cat_fact_app/core/data/repository_impl.dart';
import 'package:flutter_cat_fact_app/core/domain/repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {

  getIt.registerSingleton<ApiServices>(ApiServices());
  getIt.registerSingleton<NetworkBoundResource>(NetworkBoundResource());

  getIt.registerSingleton<Repository>(RepositoryImpl(getIt(), getIt()));
}