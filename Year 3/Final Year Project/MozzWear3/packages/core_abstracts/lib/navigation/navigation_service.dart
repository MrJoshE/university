import 'package:flutter/widgets.dart';

import '../interfaces.dart';
import '../navigation.dart';

/// Definition of the navigation service that is responsible for navigation of all pages in the app.
///
/// An instance of [NavigationService] is a singleton and available via dependency injection. It is also available via
/// static instance of [locator], but only in the application head (driver application) and and in the "view" layer.
///
/// The instance of the [NavigationService] can be accessed like this:
///
/// ```dart
/// // Anywhere in the app - reusable instance via constructor dependency injection
/// class AppCubit extends Cubit<AppState> {
///   final NavigationService _navigationService;
///
///   AppCubit(this._navigationService);
/// }
///
/// // App head and "view" layer only - reusable instance via locator
/// final NavigationService _navigationService = locator();
/// ```
///
/// Instead of [Route] objects used by [Navigator.of(context)] the [NavigationService] operates with instances of a
/// [PageDescriptor] that describes all pages of the app as [MaterialPageRoute] objects. [PageDescriptor] is a handy
/// wrapper of the [MaterialPageRoute] that can be used in layers of the application that are not aware of the pages,
/// such as "state" or "model" layer, as well as other modules of the app that might not be aware of pages present in
/// other modules.
///
/// Although instances of [PageDescriptor] can be constructed manually, we use [PageDescriptorFactory] class for
/// generating instances of [PageDescriptor]. The [PageDescriptorFactory] makes it possible to create instances of
/// [PageDescriptor] in layers of the application such as "state" or "model", as well as in other modules of the app.
///
/// Typical usage is as follows:
///
/// ```dart
/// class AppCubit extends Cubit<AppState> {
///   final PageDescriptorFactory _pageDescriptorFactory;
///   final NavigationService _navigationService;
///
///   AppCubit(this._pageDescriptorFactory, this._navigationService);
///
///   Future openHomePage() async {
///     final pageDescriptor = _pageDescriptorFactory.getHomePageDescriptor();
///     return await _navigationService.push(pageDescriptor);
///   }
/// }
/// ```
abstract class NavigationService implements Disposable {
  /// Gets a value indicating whether a page can be popped out of the navigation stack.
  ///
  /// Returns [true] for pages that can be popped out of the navigation stack, otherwise [false]. The first page that
  /// cannot be popped is [Route.isFirst].
  bool get canPop;

  // Provides notification events about navigation activities
  Stream<OnNavigationServiceNavigatedEvent> get onNavigated;

  /// Pushes the page given in the [pageDescriptor] onto the navigation stack.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// Future _openHomePage() async {
  ///   final pageDescriptor = _pageDescriptorFactory.getHomePageDescriptor();
  ///   return await _navigationService.push(pageDescriptor);
  /// }
  /// ```
  Future<TResult?> push<TResult extends PageResult?, TArgs extends PageArgs?>(
    PageDescriptor<TResult, TArgs> pageDescriptor,
  );

  /// Replace the current page of the navigation stack by pushing the given [pageDescriptor] and then disposing the
  /// previous page once the new page has finished animating in.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// Future _openHomePage() async {
  ///   final pageDescriptor = _pageDescriptorFactory.getHomePageDescriptor();
  ///   return await _navigationService.pushReplacement(pageDescriptor);
  /// }
  /// ```
  Future<TResult?> pushReplacement<TResult extends PageResult?, TO extends PageResult?, TArgs extends PageArgs?>(
    PageDescriptor<TResult, TArgs> pageDescriptor, {
    TO? result,
  });

  /// Pushes the page described by the given [pageDescriptor] onto the navigation stack, and then removes all other
  /// pages.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// Future _signOut() async {
  ///   final signInPageDescriptor = _pageDescriptorFactory.getSignInPageDescriptor();
  ///   return await _navigationService.
  ///       pushAndRemoveAll(signInPageDescriptor);
  /// }
  /// ```
  Future<TResult?> pushAndRemoveAll<TResult extends PageResult?, TArgs extends PageArgs?>(
    PageDescriptor<TResult, TArgs> pageDescriptor,
  );

  /// Pushes the page described by the given [pageDescriptor] onto the navigation stack, and then removes all the
  /// below pages until the [predicate] returns [true].
  ///
  /// The predicate may be applied to the same page more than once if [Route.willHandlePopInternally] is true.
  ///
  /// To remove pages until a page with a certain name, use the [RoutePredicate] is as follows:
  ///
  /// ```dart
  /// Future _resetAndOpenPage() async {
  ///   final settingsPageDescriptor = _pageDescriptorFactory.getSettingsPageDescriptor();
  ///   final homePageDescriptor = _pageDescriptorFactory.getHomePageDescriptor();
  ///   return await _navigationService.
  ///       pushAndRemoveUntil(settingsPageDescriptor, (route) => route.settings.name == homePageDescriptor.name);
  /// }
  /// ```
  Future<TResult?> pushAndRemoveUntil<TResult extends PageResult?, TArgs extends PageArgs?>(
    PageDescriptor<TResult, TArgs> pageDescriptor,
    RoutePredicate predicate,
  );

  /// Replaces a page specified by the [oldPageDescriptor] on the navigation stack with a new page specified by the
  /// [newPageDescriptor].
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// void _showPaymentSuccessPage() {
  ///   final paymentPageDescriptor = _pageDescriptorFactory.getPaymentPageDescriptor();
  ///   final paymentSuccessPageDescriptor = _pageDescriptorFactory.getPaymentSuccessPageDescriptor();
  ///   await _navigationService.replace(paymentPageDescriptor, paymentSuccessPageDescriptor);
  /// }
  /// ```
  void replace<TResult extends PageResult?, TArgs extends PageArgs?>(
    PageDescriptor<TResult, TArgs> oldPageDescriptor,
    PageDescriptor<TResult, TArgs> newPageDescriptor,
  );

  /// Replaces the page that is located under the one specified by the [anchorPageDescriptor] with the new page that
  /// specified by the [newPageDescriptor].
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// void _replaceHomePage() {
  ///   final currentPageDescriptor = _pageDescriptorFactory.getSuccessfulLoginPageDescriptor();
  ///   final newHomePageDescriptor = _pageDescriptorFactory.getHomePageDescriptor();
  ///   await _navigationService.replacePageBelow(currentPageDescriptor, newHomePageDescriptor);
  /// }
  /// ```
  ///
  /// See also:
  ///
  ///  * [replace], which is the same but identifies the page to be removed directly.
  void replacePageBelow<TResult extends PageResult?, TArgs extends PageArgs?>(
    PageDescriptor<dynamic, dynamic> anchorPageDescriptor,
    PageDescriptor<TResult, TArgs> newPageDescriptor,
  );

  /// Consults the current page's [Route.willPop] method, and acts accordingly, potentially popping the page as a
  /// result; returns whether the pop request should be considered handled.
  ///
  /// See also:
  ///
  ///  * [Form], which provides an `onWillPop` callback that enables the form to veto a [pop] initiated by the app's
  /// back button.
  ///  * [ModalRoute], which provides a `scopedWillPopCallback` that can be used to define the page's `willPop` method.
  Future<bool> maybePop<TResult extends PageResult?>([TResult? result]);

  /// Pops the top-most page from the navigation stack.
  ///
  /// Typical usage for closing a page is as follows:
  ///
  /// ```dart
  /// void _handleClose() {
  ///   _navigationService.pop();
  /// }
  /// ```
  /// A dialog box might be closed with a result:
  ///
  /// ```dart
  /// void _handleAccept() {
  ///   _navigationService.pop(true); // dialog returns true
  /// }
  /// ```
  void pop<TResult extends PageResult?>([TResult? result]);

  /// Pops all pages from the navigation stack until the first page is reached.
  ///
  /// Typical usage for going to the home page is as follows:
  ///
  /// ```dart
  /// void _goHome() {
  ///   _navigationService.popAll();
  /// }
  void popAll();

  /// Calls [pop] method repeatedly until the page specified by the [pageDescriptor] is found.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// void _doLogout() {
  ///   final homePageDescriptor = _pageDescriptorFactory.getHomePageDescriptor();
  ///   _navigationService.popUntil(homePageDescriptor);
  /// }
  /// ```
  ///
  /// In case page descriptor requires parameters the usage is as follows:
  ///
  /// ```dart
  /// void _goBackToCardNeedHelp() {
  ///   final cardNeedHelpPageDescriptor = _pageDescriptorFactory.getCardNeedHelpPageDescriptor(CardNeedHelpPageArgs.empty());
  ///   _navigationService.popUntil(cardNeedHelpPageDescriptor);
  /// }
  /// ```
  void popUntil<TResult extends PageResult?, TArgs extends PageArgs?>(PageDescriptor<TResult, TArgs> pageDescriptor);

  /// Removes the page specified by the [pageDescriptor] from the navigation stack, and disposes the page.
  void removePage<TResult extends PageResult?, TArgs extends PageArgs?>(PageDescriptor<TResult, TArgs> pageDescriptor);

  /// Immediately removes the page that is located immediately below the page specified by the [anchorPageDescriptor]
  /// and disposes it.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// void _showPaymentResult(bool isSuccessful) {
  ///   PageDescriptor nextPageDescriptor;
  ///
  ///   nextPageDescriptor = isSuccessful ?
  ///       _pageDescriptorFactory.getPaymentSuccessPageDescriptor() :
  ///       _pageDescriptorFactory.getPaymentFailurePageDescriptor();
  ///
  ///   await _navigationService.push(nextPageDescriptor);
  ///
  ///   // We don't need payment page anymore, so removing it; Keep the payment page if not successful
  ///   if (isSuccessful) {
  ///     await _navigationService.removePageBelow(nextPageDescriptor);
  ///   }
  /// }
  /// ```
  void removePageBelow<TResult extends PageResult?, TArgs extends PageArgs?>(
    PageDescriptor<TResult, TArgs> anchorPageDescriptor,
  );

}
