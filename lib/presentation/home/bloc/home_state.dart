part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();
}

final class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

final class HomeApiSuccess extends HomeState {

  final List<String> banners;
  final List<CatFactsEntity> catFacts;

  const HomeApiSuccess({required this.banners, required this.catFacts});

  @override
  List<Object?> get props => [banners, catFacts];

}

final class HomeApiFailed extends HomeState {

  final String errorMessage;

  const HomeApiFailed({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];

}
