import 'package:flutter/widgets.dart';

/// This provides an extensible abstraction of a WidgetBuilder that can be extended with additional properties, such as
/// analytic event. This descriptor is used for describing navigable widgets to the [NavigationService].
///
abstract class NavigationDescriptor<TArgs> {
  /// Provides access to WidgetBuilder object that can be used for initialising an instance of the widget
  final WidgetBuilder builder;

  /// Gets the name of the widget
  final String name;

  /// Gets the widget arguments
  final TArgs? args;

  NavigationDescriptor(this.builder, this.name, this.args);
}
