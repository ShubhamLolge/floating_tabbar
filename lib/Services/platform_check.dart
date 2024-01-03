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
    showComp() async {}

    showComp();

    bool isDisplayDesktop(BuildContext context) => windowType >= AdaptiveWindowType.medium;
    bool isDisplaySmallDesktop(BuildContext context) => windowType <= AdaptiveWindowType.medium && getWindowType(context) >= AdaptiveWindowType.small;
    bool isDisplayMobile(BuildContext context) => windowType <= AdaptiveWindowType.xsmall;

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

/* Responsive class from user dashboard webapp */
class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  }) : super(key: key);

  static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 850;
  static bool isTablet(BuildContext context) => MediaQuery.of(context).size.width < 1100 && MediaQuery.of(context).size.width >= 850;
  static bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (size.width >= 1100) {
      return desktop;
    } else if (size.width >= 850 && tablet != null) {
      return tablet!;
    } else {
      return mobile;
    }
  }
}

/* Responsive widget from sankalpsiddhi */

// import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget? mediumScreen;
  final Widget? smallScreen;

  const ResponsiveWidget({Key? key, required this.largeScreen, this.mediumScreen, this.smallScreen}) : super(key: key);

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 800;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 1200;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= 800 && MediaQuery.of(context).size.width <= 1200;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return largeScreen;
        } else if (constraints.maxWidth <= 1200 && constraints.maxWidth >= 800) {
          return mediumScreen ?? largeScreen;
        } else {
          return smallScreen ?? largeScreen;
        }
      },
    );
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
