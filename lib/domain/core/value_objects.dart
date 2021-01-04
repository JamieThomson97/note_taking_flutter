import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import '../auth/failures.dart';
import 'errors.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();
  Either<ValueFailure<T>, T> get value;

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is ValueObject<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';

  bool isValid() => value.isRight();

  T getOrCrash() {
    return value.fold((l) => throw UnexpectedValueError(l), (r) => r);
  }
}

class UniqueId extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;
  factory UniqueId() {
    return UniqueId._(right("fake uId"));
  }

  factory UniqueId.fromUniqueString(String uId) {
    assert(uId != null);
    return UniqueId._(
      right(uId),
    );
  }

  const UniqueId._(this.value);
}
