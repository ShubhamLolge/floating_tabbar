import 'package:floating_tabbar/lib.dart';

@Deprecated(
    "BadgeWraper widget is going to be removed from the package, instead use 'NotificationBadge' it is more customizable.")
class BadgeWraper extends StatelessWidget {
  /// This is the widget on which badge will be displayed
  final Widget? child;

  /// This will tell if to show badge
  final bool? showBadge;

  /// This will show badge count
  final int? badgeCount;

  /// This will show badge count
  final Color? bageColor;

  const BadgeWraper({
    Key? key,
    this.child,
    this.bageColor = Colors.red,
    this.showBadge = false,
    this.badgeCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(width: 35, child: Row(children: [Expanded(child: child!)])),
        showBadge == true
            ? Positioned(
                right: 0,
                top: 0,
                child: Container(
                  height: 16,
                  width: 16,
                  padding: const EdgeInsets.all(3),
                  decoration:
                      BoxDecoration(color: bageColor, shape: BoxShape.circle),
                  child: Center(
                    child: Text(
                      '$badgeCount',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
