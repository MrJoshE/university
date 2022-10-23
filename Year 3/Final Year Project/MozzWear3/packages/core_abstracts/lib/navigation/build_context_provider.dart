import 'package:flutter/widgets.dart';

/// Definition of class responsible for providing access to the root build context that is required for some services such as [NavigationService].
abstract class BuildContextProvider {
  /// Initialises the service with the specified [context]
  void init(BuildContext context);

  /// Gets the root build context
  BuildContext get context;
  // Null-safety version
  // BuildContext? get context;
}
