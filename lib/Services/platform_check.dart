import 'package:floating_tabbar/lib.dart';

class PlatformCheck {
  String platformCheck({required BuildContext context}) {
    String platform = '';

    /* Used "adaptive_breakpoints: for defining Web for desktop tablet and mobile */
    bool isDisplayDesktop(BuildContext context) =>
        getWindowType(context) >= AdaptiveWindowType.medium;
    bool isDisplaySmallDesktop(BuildContext context) =>
        getWindowType(context) <= AdaptiveWindowType.medium &&
        getWindowType(context) >= AdaptiveWindowType.small;
    bool isDisplayMobile(BuildContext context) =>
        getWindowType(context) <= AdaptiveWindowType.xsmall;

    final isDesktop = isDisplayDesktop(context);
    final isTablet = isDisplaySmallDesktop(context);
    final isMobile = isDisplayMobile(context);

    if (!kIsWeb) {
      if (Platform.isAndroid) {
        platform = 'Android';
      } else if (Platform.isIOS) {
        platform = 'iOS';
      } else if (Platform.isMacOS) {
        platform = 'MacOS';
      } else if (Platform.isWindows) {
        platform = 'Windows';
      } else if (Platform.isLinux) {
        platform = 'Linux';
      } else if (Platform.isFuchsia) {
        platform = 'Fuchsia';
      }
    } else {
      if (isDesktop) {
        platform = 'Web Desktop';
      } else if (isTablet) {
        platform = 'Web Tablet';
      } else if (isMobile) {
        platform = 'Web Mobile';
      }
    }
    return platform;
  }
}
