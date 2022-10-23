import '../navigation.dart';

/// Definition of factory responsible for identification of the start page
abstract class StartPageDescriptorFactory {
  /// Gets start page descriptor for the initial start page of the app
  Future<PageDescriptor> getStartPageDescriptor({required bool checkLegalStuff});
}
