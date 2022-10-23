import 'package:meta/meta.dart';

/// Represents default page result that wraps the values passed back by the page
///
/// Each page returning a result must have a dedicated result object, with tha name extending the page name,
/// e.g. page [SignInErrorPage] must have a dedicated result object class called [SignInErrorPageResult]
///
/// ```dart
/// @immutable
/// class SignInErrorPageResult extends PageResult {
///   final bool shouldTryAgain;
///
///   SignInErrorPageResult(this.shouldTryAgain)
/// }
/// ```
///
/// When deriving from this class, implement constructors that represent dialog action, such as [close] for close button
/// press, or [itemSelected], when menu item is selected, e.g.:
///
/// ```dart
/// closeIconButtonOnPressed: () => resultSource.setResult(const AccountSummaryMenuDialogResult.closed())
///
/// onTap: () => resultSource.setResult(AccountSummaryMenuDialogResult.itemSelected(pageDescriptor: menuItem.pageDescriptor))
/// ```
///
/// Example of dismiss and confirm actions:
///
/// ```dart
/// closeIconButtonOnPressed: () => resultSource.setResult(const PageResult.dismissed())
///
/// onPressed: () => resultSource.setResult(const PageResult.confirmed()),
/// ```
///
/// When deriving from this class, implement constructors that represent page action, such as [close] for close button
/// press, or [paymentDateSelected], when a payment date is selected, e.g.:
///
/// ```dart
/// closeIconButtonOnPressed: () => resultSource.setResult(const PaymentDatePageResult.closed())
///
/// onTap: () => resultSource.setResult(PaymentDatePageResult.paymentDateSelected(date: selectedPaymentDate))
/// ```
@immutable
class PageResult {
  /// Gets a value indicating that the page has a positive result representing the user action.
  ///
  /// In the most basic scenario the minimum result is [PageResult.confirmed()] that indicates that the user provided a
  /// positive action.
  final bool hasResult;

  /// Initialises an instance of [PageResult] that indicates the user navigated away without providing an action
  const PageResult.dismissed() : hasResult = false;

  /// Initialises an instance of [PageResult] that indicates confirmed action
  const PageResult.confirmed() : hasResult = true;
}
