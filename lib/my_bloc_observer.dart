import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class MyBlocObserver extends BlocObserver {
  const MyBlocObserver();

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    Logger().i('onEvent: $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    Logger().i('onChange: ${change.currentState}');
  }

  @override
  void onTransition(Bloc<dynamic, dynamic> bloc, Transition<dynamic, dynamic> transition,) {
    super.onTransition(bloc, transition);
    Logger().i('onTransition: ${transition.currentState} -> ${transition.nextState}');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    Logger().e(error);
  }
}