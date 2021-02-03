enum Flavor { mock, dev, prod }

// ignore: avoid_classes_with_only_static_members
abstract class FlavorModel {
  static Flavor appFlavor;

  static String get title {
    switch (appFlavor) {
      case Flavor.mock:
        return 'Visit Now Mock';
      case Flavor.dev:
        return 'Visit Now Dev';
      case Flavor.prod:
        return 'Visit Now';
      default:
        return 'Visit Now Mock';
    }
  }

  static bool get isMock => appFlavor == Flavor.mock;

  static bool get isProduction => appFlavor == Flavor.prod;

  static String get baseURL {
    switch (appFlavor) {
      case Flavor.mock:
        return 'mock';
      case Flavor.dev:
        return 'http://api.dev.com.br';
      case Flavor.prod:
        return 'http://api.prod.com.br';
      default:
        return 'mock';
    }
  }
}
