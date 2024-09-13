import 'package:equatable/equatable.dart';

sealed class ApiResult<Type> extends Equatable {
  @override
  List<Object?> get props => [];
}

final class ApiSuccess<Type> extends ApiResult {
  final Type data;
  ApiSuccess(this.data);
}

final class ApiError<Type> extends ApiResult {

  final int errorCode;
  final String errorMessage;

  ApiError(this.errorCode, this.errorMessage);

}