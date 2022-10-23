import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
@sealed
class NotificationContent extends Equatable {
  /// The title of the notification.
  final String title;

  /// The description of the notification.
  final String? description;

  const NotificationContent({
    required this.title,
    required this.description,
  });

  @override
  List<Object?> get props => [title, description];
}
