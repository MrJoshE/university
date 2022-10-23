import '../navigation.dart';

/// Represents an event used by the [NavigationService] for communicating navigation events.
class OnNavigationServiceNavigatedEvent {
  final NavigationAction action;
  final NavigationDescriptor? descriptor;

  const OnNavigationServiceNavigatedEvent(this.action, [this.descriptor]);
}
