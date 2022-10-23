import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../core.dart';

@immutable
@sealed
class OnNotificationReceivedEvent extends Equatable{

  final NotificationContent content;
  const OnNotificationReceivedEvent({required this.content});

  @override
  List<Object?> get props => throw UnimplementedError();
}
