import 'package:floating_tabbar/lib.dart';

/// [PlatformCheck] provides us with current platform uaing current [BuildContext].
///
/// ```dart
/// // Example use
/// String currentPlatform =  PlatformCheck.platformCheck(context);
/// currentPlatform == Platforms.android ? smallScreenContent() : largeScreenContent();
/// ```
///
class PlatformCheck {
  String platformCheck({required BuildContext context}) {
    String platform = '';

    AdaptiveWindowType windowType = getWindowType(context);
    bool isDisplayDesktop(BuildContext context) =>
        windowType >= AdaptiveWindowType.medium;
    bool isDisplaySmallDesktop(BuildContext context) =>
        windowType <= AdaptiveWindowType.medium &&
        getWindowType(context) >= AdaptiveWindowType.small;
    bool isDisplayMobile(BuildContext context) =>
        windowType <= AdaptiveWindowType.xsmall;

    final isDesktop = isDisplayDesktop(context);
    final isTablet = isDisplaySmallDesktop(context);
    final isMobile = isDisplayMobile(context);

    if (!kIsWeb) {
      if (Platform.isAndroid) {
        platform = Platforms.android;
      } else if (Platform.isIOS) {
        platform = Platforms.iOS;
      } else if (Platform.isMacOS) {
        platform = Platforms.macOS;
      } else if (Platform.isWindows) {
        platform = Platforms.windows;
      } else if (Platform.isLinux) {
        platform = Platforms.linux;
      } else if (Platform.isFuchsia) {
        platform = Platforms.fuchsia;
      }
    } else {
      if (isDesktop) {
        platform = Platforms.webDesktop;
      } else if (isTablet) {
        platform = Platforms.webTablet;
      } else if (isMobile) {
        platform = Platforms.webMobile;
      }
    }
    return platform;
  }
}

class Platforms {
  /// "Android"
  static const String android = "Android";

  /// "iOS"
  static const String iOS = "iOS";

  /// "MacOS"
  static const String macOS = "MacOS";

  /// "Windows"
  static const String windows = "Windows";

  /// "Linux"
  static const String linux = "Linux";

  /// "Fuchsia"
  static const String fuchsia = "Fuchsia";

  /// "Web Desktop"
  static const String webDesktop = "Web Desktop";

  /// "Web Tablet"
  static const String webTablet = "Web Tablet";

  /// "Web Mobile"
  static const String webMobile = "Web Mobile";
}
