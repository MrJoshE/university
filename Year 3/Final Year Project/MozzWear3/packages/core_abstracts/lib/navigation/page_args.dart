import 'package:meta/meta.dart';

@immutable
class PageArgs {
  final bool disableForwardAnimation;
  final bool disableReverseAnimation;

  const PageArgs({this.disableForwardAnimation = false, this.disableReverseAnimation = false});
}
