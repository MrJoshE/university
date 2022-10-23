import 'package:flutter/material.dart';

import '../navigation.dart';

/// Provides an extensible abstraction of a MaterialPageRoute that can be extended with additional properties, such as
/// analytic event. This descriptor is used for describing pages to the [NavigationService].
///
/// Independent modules can describe their pages by implementing a [PageDescriptorFactory] and then passing
/// PageDescriptors to the [NavigationService].
///
/// [PageDescriptor] effectively implements [MaterialPageRoute], however, it does not extend from it for simplicity of
/// mocking and unit testing.
///
///
/// Page descriptors should be defined in a PageDescriptorFactory, like this:
///
/// ```dart
/// PageDescriptor<PageResult, CardTransactionPageArgs> getCardTransactionPageDescriptor(CardTransactionPageArgs args) =>
///     PageDescriptor(
///       builder: (_) => CardTransactionPage(args: args),
///       name: '$CardTransactionPage',
///       args: args,
///     );
/// ```
///
/// Pages that can be navigated to multiple times and be present in the stack simultaneously must provide unique name:
///
/// ```dart
/// PageDescriptor<PageResult, FaqsPageArgs> getFaqsPageDescriptor(FaqsPageArgs args) => PageDescriptor(
///       builder: (_) => FaqsPage(args: args),
///       name: '$FaqsPage.${args.sectionId}',
///       args: args,
///     );
/// ```
///
/// In case page requires Page Arguments, then this should be defined like this:
///
/// ```dart
/// class CardTransactionPage extends StatelessWidget {
///  final CardTransactionPageArgs args;
///
///  CardTransactionPage({Key key, required this.args}) : super(key: key);
/// ```
class PageDescriptor<TResult extends PageResult?, TArgs extends PageArgs?> implements NavigationDescriptor<TArgs> {
  /// Provides access to WidgetBuilder object that can be used for initialising an instance of the page
  @override
  final WidgetBuilder builder;

  /// Gets the name of the page
  @override
  final String name;

  /// Gets the page arguments
  @override
  final TArgs? args;

  /// Gets the route that represents
  final MaterialPageRoute<TResult> route;

  /// Creates an instance of the [PageDescriptor] for the specified [route] that
  /// will be used for notification of subscribers when navigation to the page occurs
  PageDescriptor({
    required this.builder,
    required this.name,
    this.args,
  }) : route = args != null && (args.disableForwardAnimation || args.disableReverseAnimation)
            ? _ConfigurableMaterialPageRoute<TResult>(
                builder: builder,
                settings: RouteSettings(name: name, arguments: args),
                disableForwardAnimation: args.disableForwardAnimation,
                disableReverseAnimation: args.disableReverseAnimation,
              )
            : MaterialPageRoute<TResult>(
                builder: builder,
                settings: RouteSettings(name: name, arguments: args),
              );

  /// Creates an instance of the [PageDescriptor] suitable for setting up mocking stubs in tests
  @visibleForTesting
  PageDescriptor.test()
      : builder = ((_) => const SizedBox.shrink()),
        name = 'Test',
        args = null,
        route = MaterialPageRoute<TResult>(
          builder: (_) => const SizedBox.shrink(),
          settings: const RouteSettings(name: 'Test'),
        );
}

/// Implements a [MaterialPageRoute<TResult>] where forward and reverse animations can be disabled
/// This class could be extended with more parameters
class _ConfigurableMaterialPageRoute<TResult> extends MaterialPageRoute<TResult> {
  final bool disableForwardAnimation;
  final bool disableReverseAnimation;

  _ConfigurableMaterialPageRoute({
    required WidgetBuilder builder,
    RouteSettings? settings,
    required this.disableForwardAnimation,
    required this.disableReverseAnimation,
  }) : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    switch (animation.status) {
      case AnimationStatus.forward:
        if (disableForwardAnimation) {
          return child;
        }

        break;

      case AnimationStatus.reverse:
        if (disableReverseAnimation) {
          return child;
        }

        break;

      default:
        break;
    }

    return super.buildTransitions(context, animation, secondaryAnimation, child);
  }
}
