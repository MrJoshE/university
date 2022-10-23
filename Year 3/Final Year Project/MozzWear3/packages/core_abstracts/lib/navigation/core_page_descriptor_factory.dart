import '../navigation.dart';

abstract class CorePageDescriptorFactory {
  /// Gets a page descriptor for the starting page of when the app starts, which is the [SplashPage]
  PageDescriptor<PageResult, PageArgs> getDefaultPageDescriptor();

  /// Gets a page descriptor for the home page after authentication
  PageDescriptor<PageResult, PageArgs> getHomePageDescriptor();

  PageDescriptor<PageResult, PageArgs> getSettingsPageDescriptor();

  // Launch App
  PageDescriptor<PageResult, PageArgs> getSplashPageDescriptor();


  // Main record page
  PageDescriptor<PageResult, PageArgs> getRecordPageDescriptor();
}
