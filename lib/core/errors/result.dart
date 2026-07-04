import 'failures.dart';

sealed class Result<T> {
  const Result();

  const factory Result.success(T value) = Success<T>;
  const factory Result.failure(Failure failure) = FailureResult<T>;

  bool get isSuccess => this is Success<T>;
  bool get isFailure => this is FailureResult<T>;

  T? get getOrNull => fold((value) => value, (_) => null);

  Failure? get failureOrNull => fold((_) => null, (failure) => failure);

  R fold<R>(
    R Function(T value) onSuccess,
    R Function(Failure failure) onFailure,
  ) {
    final self = this;
    if (self is Success<T>) {
      return onSuccess(self.value);
    } else if (self is FailureResult<T>) {
      return onFailure(self.failure);
    }
    throw AssertionError('Unexpected state');
  }
}

class Success<T> extends Result<T> {
  final T value;
  const Success(this.value) : super();
}

class FailureResult<T> extends Result<T> {
  final Failure failure;
  const FailureResult(this.failure) : super();
}
