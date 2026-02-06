import 'dart:io';
import 'dart:math';

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// [PlatformCheck] provides us with current platform using current [BuildContext].
///
/// ```dart
/// // Example use
/// String currentPlatform =  PlatformCheck.platformCheck(context);
/// currentPlatform == Platforms.android ? smallScreenContent() : largeScreenContent();
/// ```
///
class PlatformCheck {
  /// Tablet threshold in inches (diagonal screen size)
  static const double tabletThresholdInches = 7.0;

  String platformCheck({required BuildContext context}) {
    String platform = '';

    AdaptiveWindowType windowType = getWindowType(context);
    bool isDisplayDesktop(BuildContext context) => windowType >= AdaptiveWindowType.medium;
    bool isDisplaySmallDesktop(BuildContext context) => windowType <= AdaptiveWindowType.medium && getWindowType(context) >= AdaptiveWindowType.small;
    bool isDisplayMobile(BuildContext context) => windowType <= AdaptiveWindowType.xsmall;

    final isDesktop = isDisplayDesktop(context);
    final isTablet = isDisplaySmallDesktop(context);
    final isMobile = isDisplayMobile(context);

    if (!kIsWeb) {
      // Check if device is a tablet based on screen size
      final isDeviceTablet = _isTabletDevice(context);
      final isLandscape = _isLandscape(context);

      if (Platform.isAndroid) {
        if (isDeviceTablet) {
          platform = isLandscape ? Platforms.androidTabletLandscape : Platforms.androidTabletPortrait;
        } else {
          platform = Platforms.android;
        }
      } else if (Platform.isIOS) {
        if (isDeviceTablet) {
          platform = isLandscape ? Platforms.iOSTabletLandscape : Platforms.iOSTabletPortrait;
        } else {
          platform = Platforms.iOS;
        }
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
        final isLandscape = _isLandscape(context);
        platform = isLandscape ? Platforms.webTabletLandscape : Platforms.webTabletPortrait;
      } else if (isMobile) {
        platform = Platforms.webMobile;
      }
    }
    return platform;
  }

  /// Determines if the device is a tablet based on screen diagonal size
  bool _isTabletDevice(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;
    final devicePixelRatio = mediaQuery.devicePixelRatio;

    // Calculate physical screen size in inches
    final width = size.width * devicePixelRatio;
    final height = size.height * devicePixelRatio;
    final diagonalPixels = sqrt(width * width + height * height);

    // Assuming ~160 DPI as baseline (standard for mdpi on Android)
    // For iOS, this approximation works reasonably well
    final diagonalInches = diagonalPixels / 160;

    return diagonalInches >= tabletThresholdInches;
  }

  /// Determines if the device is in landscape orientation
  bool _isLandscape(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return orientation == Orientation.landscape;
  }

  /// Static helper: Returns true if the platform string represents a tablet (any orientation)
  static bool isTablet(String platform) {
    return platform == Platforms.androidTabletPortrait ||
        platform == Platforms.androidTabletLandscape ||
        platform == Platforms.iOSTabletPortrait ||
        platform == Platforms.iOSTabletLandscape ||
        platform == Platforms.webTabletPortrait ||
        platform == Platforms.webTabletLandscape ||
        platform == Platforms.webTablet;
  }

  /// Static helper: Returns true if the platform string represents a tablet in portrait mode
  static bool isTabletPortrait(String platform) {
    return platform == Platforms.androidTabletPortrait || platform == Platforms.iOSTabletPortrait || platform == Platforms.webTabletPortrait;
  }

  /// Static helper: Returns true if the platform string represents a tablet in landscape mode
  static bool isTabletLandscape(String platform) {
    return platform == Platforms.androidTabletLandscape || platform == Platforms.iOSTabletLandscape || platform == Platforms.webTabletLandscape;
  }

  /// Static helper: Returns true if the platform string represents a mobile phone (not tablet)
  static bool isMobile(String platform) {
    return platform == Platforms.android || platform == Platforms.iOS || platform == Platforms.webMobile;
  }

  /// Static helper: Returns true if the platform is web (any size)
  static bool isWeb(String platform) {
    return platform == Platforms.webDesktop ||
        platform == Platforms.webTablet ||
        platform == Platforms.webTabletPortrait ||
        platform == Platforms.webTabletLandscape ||
        platform == Platforms.webMobile;
  }

  /// Static helper: Returns true if the platform is native (not web)
  static bool isNative(String platform) {
    return !isWeb(platform);
  }

  /// Static helper: Returns true if the platform is Android (phone or tablet)
  static bool isAndroid(String platform) {
    return platform == Platforms.android || platform == Platforms.androidTabletPortrait || platform == Platforms.androidTabletLandscape;
  }

  /// Static helper: Returns true if the platform is iOS (phone or tablet)
  static bool isIOS(String platform) {
    return platform == Platforms.iOS || platform == Platforms.iOSTabletPortrait || platform == Platforms.iOSTabletLandscape;
  }

  /// Static helper: Returns true if the platform is desktop (macOS, Windows, Linux, or web desktop)
  static bool isDesktop(String platform) {
    return platform == Platforms.macOS || platform == Platforms.windows || platform == Platforms.linux || platform == Platforms.webDesktop;
  }

  /// Static helper: Returns true if the platform is in landscape orientation
  static bool isLandscapeOrientation(String platform) {
    return platform == Platforms.androidTabletLandscape || platform == Platforms.iOSTabletLandscape || platform == Platforms.webTabletLandscape;
  }

  /// Static helper: Returns true if the platform is in portrait orientation
  static bool isPortraitOrientation(String platform) {
    return platform == Platforms.androidTabletPortrait || platform == Platforms.iOSTabletPortrait || platform == Platforms.webTabletPortrait;
  }
}

class Platforms {
  /// "Android"
  static const String android = "Android";

  /// "iOS"
  static const String iOS = "iOS";

  /// "Android Tablet Portrait"
  static const String androidTabletPortrait = "Android Tablet Portrait";

  /// "Android Tablet Landscape"
  static const String androidTabletLandscape = "Android Tablet Landscape";

  /// "iOS Tablet Portrait"
  static const String iOSTabletPortrait = "iOS Tablet Portrait";

  /// "iOS Tablet Landscape"
  static const String iOSTabletLandscape = "iOS Tablet Landscape";

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

  /// "Web Tablet Portrait"
  static const String webTabletPortrait = "Web Tablet Portrait";

  /// "Web Tablet Landscape"
  static const String webTabletLandscape = "Web Tablet Landscape";

  /// "Web Mobile"
  static const String webMobile = "Web Mobile";
}

/// Extension on String to provide convenient platform checking methods
extension PlatformStringExt on String {
  /// Returns true if this platform string represents a tablet (any orientation)
  bool get isTablet => PlatformCheck.isTablet(this);

  /// Returns true if this platform string represents a tablet in portrait mode
  bool get isTabletPortrait => PlatformCheck.isTabletPortrait(this);

  /// Returns true if this platform string represents a tablet in landscape mode
  bool get isTabletLandscape => PlatformCheck.isTabletLandscape(this);

  /// Returns true if this platform string represents a mobile phone (not tablet)
  bool get isMobile => PlatformCheck.isMobile(this);

  /// Returns true if this platform is web (any size)
  bool get isWeb => PlatformCheck.isWeb(this);

  /// Returns true if this platform is native (not web)
  bool get isNative => PlatformCheck.isNative(this);

  /// Returns true if this platform is Android (phone or tablet)
  bool get isAndroid => PlatformCheck.isAndroid(this);

  /// Returns true if this platform is iOS (phone or tablet)
  bool get isIOS => PlatformCheck.isIOS(this);

  /// Returns true if this platform is desktop (macOS, Windows, Linux, or web desktop)
  bool get isDesktop => PlatformCheck.isDesktop(this);

  /// Returns true if this platform is in landscape orientation
  bool get isLandscapeOrientation => PlatformCheck.isLandscapeOrientation(this);

  /// Returns true if this platform is in portrait orientation
  bool get isPortraitOrientation => PlatformCheck.isPortraitOrientation(this);
}
