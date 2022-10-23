import 'dart:async';

/// Definition of the interface for disposing unmanaged resources. The consumer of a managed object must call [dispose]
/// method when the object is no longer needed.
///
/// For more information refer to [Disposable Pattern](https://vbl-core.visualstudio.com/Vanquis%20Engineering/_wiki/wikis/Vanquis-Engineering.wiki/10476/Disposable-Pattern)
abstract class Disposable {
  /// Gets a value indicating whether the object has disposed its unmanaged resources
  bool get isDisposed;

  /// Disposes unmanaged resources of the object
  FutureOr<void> dispose();
}
