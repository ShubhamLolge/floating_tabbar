import 'package:floating_tabbar/lib.dart';
import 'package:intl/intl.dart';

class NotificationBadge extends StatefulWidget {
  final Widget? child;

  /// [extraDot] will be in row with DOT notifier.
  /// Max size must not exceed 8.
  final Widget? extraDot;

  final bool showDot;

  /// [count] must be greater than zero, if the [count] is zero badge will not show up.
  final int count;

  /// Color of badge, default red.
  final Color? badgeColor;

  /// Textstyle for count text.
  final TextStyle? countStyle;

  /// Textstyle for count text.
  final bool notifyAsDot;

  /// Badge alignment.
  ///
  /// Only provide top left, top right, and bottom left, bottom right,
  /// default 'top right',
  /// consider choosing from the below options.
  /// ```dart
  /// Alignment.topRight // top right
  /// Alignment.topLeft // top left
  /// Alignment.bottomRight // bottom right
  /// Alignment.bottomLeft // bottom left
  /// ```
  final Alignment alignment;

  const NotificationBadge({
    Key? key,
    required this.child,
    this.count = 0,
    this.badgeColor,
    this.countStyle,
    this.alignment = Alignment.topRight,
    this.notifyAsDot = false,
    this.extraDot,
    this.showDot = true,
  }) : super(key: key);

  @override
  State<NotificationBadge> createState() => _NotificationBadgeState();
}

class _NotificationBadgeState extends State<NotificationBadge> {
  double? _left;
  double? _right;
  double? _top;
  double? _bottom;
  String? displayCount;

  String getDisplayCount() {
    if (widget.count < 1000) {
      return widget.count.toString();
    } else {
      final NumberFormat formatter = NumberFormat.compact();
      return formatter.format(widget.count);
    }
  }

  EdgeInsetsGeometry getBadgePositionPadding() {
    EdgeInsetsGeometry padding = widget.notifyAsDot == true
        ? const EdgeInsets.only(top: 1)
        : EdgeInsets.only(
            top: widget.alignment == Alignment.topLeft || widget.alignment == Alignment.topRight ? 5 : 0, // 5
            left: 5,
            right: 5,
            bottom: widget.alignment == Alignment.bottomLeft || widget.alignment == Alignment.bottomRight ? 5 : 0,
          );
    return padding;
  }

  EdgeInsetsGeometry getBadgePositionMargin({required String displayCount}) {
    EdgeInsetsGeometry margin = widget.notifyAsDot == true
        ? const EdgeInsets.only(top: 1)
        : EdgeInsets.only(
            top: widget.alignment == Alignment.topLeft || widget.alignment == Alignment.topRight ? 5 : 0, // 5
            bottom: widget.alignment == Alignment.bottomLeft || widget.alignment == Alignment.bottomRight ? 5 : 0,
            left: widget.alignment == Alignment.topLeft || widget.alignment == Alignment.bottomLeft ? (displayCount.length > 2 ? 20 : 1) : 0,
            right: widget.alignment == Alignment.topRight || widget.alignment == Alignment.bottomRight ? (displayCount.length > 2 ? 20 : 1) : 0,
          );
    return margin;
  }

  void getPositionValues() {
    if (widget.alignment == Alignment.topRight) {
      setState(() {
        _top = 1;
        _right = 1;
        _bottom = null;
        _left = null;
      });
    } else if (widget.alignment == Alignment.bottomRight) {
      setState(() {
        _bottom = 1;
        _right = 1;
        _top = null;
        _left = null;
      });
    } else if (widget.alignment == Alignment.topLeft) {
      setState(() {
        _top = 1;
        _left = 1;
        _bottom = null;
        _right = null;
      });
    } else {
      setState(() {
        _bottom = 1;
        _left = 1;
        _top = null;
        _right = null;
      });
    }
  }

  @override
  void didChangeDependencies() {
    displayCount = getDisplayCount();
    getPositionValues();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Widget dot = Container(
      margin: const EdgeInsets.all(0.5),
      height: 5,
      width: 5,
      decoration: BoxDecoration(shape: BoxShape.circle, color: widget.badgeColor ?? Colors.red),
    );
    return Material(
      color: Colors.transparent,
      child: widget.count == 0 && widget.extraDot == null
          ? widget.child
          : Stack(
              children: [
                Container(
                  margin: getBadgePositionMargin(displayCount: displayCount!),
                  padding: getBadgePositionPadding(),
                  child: widget.child,
                ),
                widget.notifyAsDot == true
                    ? Positioned(
                        left: _left,
                        right: _right,
                        top: _top,
                        bottom: _bottom,
                        child: SizedBox(
                          width: 20,
                          height: 8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              widget.extraDot ?? Container(),
                              widget.showDot == true ? dot : Container(),
                            ],
                          ),
                        ))
                    : Positioned(
                        left: _left,
                        right: _right,
                        top: _top,
                        bottom: _bottom,
                        child: BadgeContainer(
                          notifiAsDot: widget.notifyAsDot,
                          badgeColor: widget.badgeColor ?? Colors.red,
                          count: widget.count,
                          countStyle: widget.countStyle ?? const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                        ),
                      ),
              ],
            ),
    );
  }
}

class BadgeContainer extends StatefulWidget {
  final Color badgeColor;
  final int count;
  final TextStyle countStyle;
  final bool notifiAsDot;

  const BadgeContainer({
    Key? key,
    this.badgeColor = Colors.red,
    this.count = 0,
    this.notifiAsDot = false,
    this.countStyle = const TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold),
  }) : super(key: key);

  @override
  State<BadgeContainer> createState() => _BadgeContainerState();
}

class _BadgeContainerState extends State<BadgeContainer> {
  String? displayCount;

  String getDisplayCount() {
    if (widget.count < 1000) {
      return widget.count.toString();
    } else {
      final NumberFormat formatter = NumberFormat.compact();
      return formatter.format(widget.count);
    }
  }

  @override
  void didChangeDependencies() {
    displayCount = getDisplayCount();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return widget.notifiAsDot == true
        ? Container(
            margin: const EdgeInsets.all(1),
            // padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
            height: 6,
            width: 6,
            decoration: BoxDecoration(shape: BoxShape.circle, color: widget.badgeColor),
          )
        : Container(
            margin: const EdgeInsets.all(1),
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
            decoration: BoxDecoration(
              color: widget.badgeColor,
              borderRadius: BorderRadius.circular(100),
            ),
            constraints: BoxConstraints(minWidth: displayCount!.length < 999 ? 15 : 20, maxHeight: 20),
            child: Center(
              child: Text(
                displayCount ?? "",
                style: widget.countStyle,
              ),
            ),
          );
  }
}
