import 'package:flutter/material.dart';

/// Defines the the base class for implementation of failure objects for use by
/// the [DataResponse] and other objects.
@immutable
abstract class Failure {
  const Failure();
}

/// Represents a failure that happened in data layer, such as a repository. Ideally this type of a failure should be
/// avoided and implementations should provide either a [NetworkFailure] or a [StorageFailure].
@immutable
class DataFailure extends Failure {
  const DataFailure();
}

/// Represents a network failure.
@immutable
class NetworkFailure extends Failure {
  const NetworkFailure();
}

/// Represents a storage failure.
@immutable
class StorageFailure extends Failure {
  const StorageFailure();
}

/// Represents an unknown failure.
@immutable
class UnknownFailure extends Failure {
  const UnknownFailure();
}

/// Represents a failure that happened in the domain layer when getting the permissions for
/// something failed.
class PermissionsFailure extends Failure {
  final String? identifier;
  const PermissionsFailure([this.identifier]);
}

/// Represents a timeout failure.
class TimeoutFailure extends Failure {
  const TimeoutFailure();
}