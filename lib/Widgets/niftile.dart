import 'package:floating_tabbar/lib.dart';
import 'package:flutter/cupertino.dart';

/// [Niftile] is derived from the words "Nifty" and "Tile" as it acts Nifty for all your usecases.
///
/// It utilizes all the data in [TabItem] object to create a multipurpose tile.
class Niftile extends StatefulWidget {
  /// [TabItem] object to hold data for the tile.
  final TabItem item;

  /// Height of the tile.
  final double? height;

  /// Width of the tile.
  final double? width;

  /// Key for the [Niftile].
  final Key? niftileKey;

  /// Boolean that enables or disables the floating interface of the tile.
  final bool isFloating;

  /// When true tile will show leading widget if provided in the [TabItem] selectedLeading or unSelectedLeading parameter.
  final bool showLeading;

  /// When true tile will show trailing widget if provided in the [TabItem] trailing parameter.
  final bool showTrailing;

  /// [buttonMode] when true, will force the [Niftile] to be like a small button with maximum width 200 and only trailing,
  /// notification, and children icons are miniature, but still functions like a default [Niftile].
  final bool buttonMode;

  /// [iconMode] when true, will force the [Niftile] to be like a small icon button with maximum height and width 100 and shows only leading.
  /// Notification, trailing and children icons are shown on hover in a [Airoll], but still functions like a default [Niftile].
  final bool iconMode;

  /// Width for tile in [buttonMode], maximum possible is 200.
  final double? buttonModeWidth;

  /// Tile highlights the title and icons when selected and [selectedColor] will show when tile is selected.
  final Color? selectedColor;

  /// When the tile is not selected [unSelectedColor] will show.
  final Color? unSelectedColor;

  /// Apart from the onTap parameter provided by the [TabItem], this [onTap] will be called when [tIOnTap] of the [TabItem] is false.
  final void Function()? onTap;

  /// Radius for the corners of the tile.
  final BorderRadiusGeometry? borderRadius;

  /// [TextStyle] for title.
  final TextStyle? titleStyle;

  /// [TextStyle] for subtitle.
  final TextStyle? subTitleStyle;

  /// Alternative [Airoll] for the tile for the cases where [TabItem] has children.
  ///
  /// To replicate the exact same UI in [buttonMode] while providing the [altAiroll] with additional parameters,
  /// you can refer the code
  ///
  /// ```dart
  /// Airoll(
  ///   children: widget.item.children,
  ///   isFloating: widget.isFloating,
  ///   showLeading: widget.showLeading,
  ///   showTrailing: widget.showTrailing,
  ///   color: widget.item.color,
  ///   child: NotificationBadge(
  ///     notifyAsDot: true,
  ///     extraDot: widget.item.children!.isNotEmpty ? Icon(widget.childrenIcon, size: 6) : null,
  ///     showDot: widget.item.badgeCount == 0 ? false : true,
  ///     count: widget.item.badgeCount ?? 0,
  ///     child: niftileChild,
  ///   ),
  /// )
  /// ```
  final Airoll? altAiroll;

  /// [childrenIcon] will show up on the tile if the [Niftile] have children which is provided from the [TabItem] children,
  /// this icons will be seen in both tile as well as button mode.
  final IconData? childrenIcon;

  /// Title and Subtitle alignment.
  final AlignmentGeometry? alignment;

  const Niftile({
    Key? key,
    required this.item,
    this.height,
    this.width,
    this.niftileKey,
    this.onTap,
    this.isFloating = true,
    this.selectedColor,
    this.unSelectedColor,
    this.borderRadius,
    this.showLeading = true,
    this.showTrailing = true,
    this.iconMode = false,
    this.buttonMode = false,
    this.buttonModeWidth = 150,
    this.titleStyle = const TextStyle(),
    this.subTitleStyle = const TextStyle(),
    this.childrenIcon = CupertinoIcons.arrow_up_arrow_down,
    this.altAiroll,
    this.alignment,
  }) : super(key: key);

  @override
  State<Niftile> createState() => _NiftileState();
}

class _NiftileState extends State<Niftile> {
  final GlobalKey<AirollState> airollKey = GlobalKey<AirollState>();
  bool isSelected = false;

  void openAiroll() {
    airollKey.currentState!.showAiroll();
  }

  @override
  Widget build(BuildContext context) {
    return widget.isFloating
        ? Floater(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            radius: widget.borderRadius ?? BorderRadius.circular(10),
            backgroundColor: widget.item.color,
            child: niftileWidget(),
          )
        : niftileWidget();
  }

  Widget getWidget() {
    Widget one;
    if (widget.item.selectedLeading.runtimeType == Icon) {
      Icon icon = widget.item.selectedLeading as Icon;
      Icon finalIcon = Icon(
        icon.icon,
        color: isSelected
            ? (widget.selectedColor ?? Theme.of(context).primaryColor)
            : (icon.color ?? widget.unSelectedColor),
      );
      one = finalIcon;
    } else if (widget.item.selectedLeading.runtimeType == Text) {
      Text text = widget.item.selectedLeading as Text;
      Text finalText = Text(
        text.data!,
        style: isSelected
            ? (text.style != null
                ? text.style!.copyWith(
                    color:
                        widget.selectedColor ?? Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  )
                : TextStyle(
                    color:
                        widget.selectedColor ?? Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold))
            : TextStyle(color: widget.unSelectedColor),
      );
      one = finalText;
    } else {
      one = widget.item.selectedLeading!;
    }
    return one;
  }

  Widget niftileWidget() {
    Widget niftileChild = SizedBox(
      height: widget.height,
      width: widget.buttonMode == true
          ? (widget.buttonModeWidth! > 200 ? 200 : widget.buttonModeWidth)
          : widget.width,
      child: ListTile(
        key: widget.niftileKey,
        title: Container(
          alignment: widget.buttonMode == true && widget.alignment == null
              ? Alignment.center
              : widget.alignment,
          child: widget.item.title,
        ),
        subtitle: widget.item.subTitle != null
            ? Container(
                alignment: widget.buttonMode == true && widget.alignment == null
                    ? Alignment.center
                    : widget.alignment,
                child: widget.item.subTitle,
              )
            : widget.item.subTitle,
        shape: RoundedRectangleBorder(
            borderRadius: widget.borderRadius ?? BorderRadius.circular(10)),
        enabled: widget.item.enabled ?? true,
        selected: isSelected,
        leading: widget.showLeading == true
            ? widget.item.selectedLeading ?? widget.item.unSelectedLeading
            : null,
        onTap: () {
          selectNiftile();
          widget.item.tIOnTap == true
              ? (widget.item.onTap != null ? widget.item.onTap!() : () {})
              : (widget.onTap != null ? widget.onTap!() : () {});
        },
        trailing: widget.showTrailing == true
            ? (widget.buttonMode == true
                ? widget.item.trailing
                : (widget.item.children!.isNotEmpty ||
                        widget.item.badgeCount != 0
                    ? SizedBox(
                        width: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            widget.item.children!.isNotEmpty
                                ? (widget.altAiroll ??
                                    Airoll(
                                      children: widget.item.children,
                                      isFloating: widget.isFloating,
                                      showLeading: widget.showLeading,
                                      showTrailing: widget.showTrailing,
                                      color: widget.item.color,
                                      child:
                                          Icon(widget.childrenIcon, size: 11),
                                    ))
                                : Container(),
                            widget.item.badgeCount != 0
                                ? BadgeContainer(count: widget.item.badgeCount!)
                                : Container(),
                            widget.item.trailing ?? Container(),
                          ],
                        ),
                      )
                    : widget.item.trailing))
            : null,
        tileColor: widget.item.color,
        selectedTileColor: widget.item.color,
        textColor: widget.unSelectedColor,
        iconColor: widget.unSelectedColor,
        selectedColor: widget.selectedColor,
        titleTextStyle: isSelected
            ? (widget.titleStyle!.copyWith(fontWeight: FontWeight.bold))
            : widget.titleStyle,
        subtitleTextStyle: isSelected
            ? (widget.subTitleStyle!.copyWith(fontWeight: FontWeight.bold))
            : widget.subTitleStyle,
      ),
    );

    /// Icon mode Niftile widget.
    Widget iMWidget() {
      return Airoll(
        enabled: false,
        key: airollKey,
        actOnHover: false,
        color: widget.item.color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        children: [
          TabItem(
            title: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 8),
                    child: widget.item.children!.isNotEmpty
                        ? (widget.altAiroll ??
                            Airoll(
                              children: widget.item.children,
                              isFloating: widget.isFloating,
                              showLeading: widget.showLeading,
                              showTrailing: widget.showTrailing,
                              color: widget.item.color,
                              child: Icon(widget.childrenIcon, size: 11),
                            ))
                        : Container(),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 8),
                    child: widget.item.badgeCount != 0
                        ? BadgeContainer(count: widget.item.badgeCount!)
                        : Container(),
                  ),
                  Container(
                      margin: const EdgeInsets.only(right: 8),
                      child: widget.item.trailing ?? Container()),
                ],
              ),
            ),
            onTap: () {},
          ),
        ],
        child: getWidget(),
      );
    }

    return ClipRRect(
      borderRadius: widget.borderRadius ?? BorderRadius.circular(10),
      child: widget.iconMode == true
          ? Container(
              padding: const EdgeInsets.all(5),
              child: InkWell(
                onTap: () {
                  selectNiftile();
                  openAiroll();
                },
                child: iMWidget(),
              ),
            )
          : (widget.buttonMode == true
              ? (widget.altAiroll ??
                  Airoll(
                    children: widget.item.children,
                    isFloating: widget.isFloating,
                    showLeading: widget.showLeading,
                    showTrailing: widget.showTrailing,
                    color: widget.item.color,
                    child: NotificationBadge(
                      notifyAsDot: true,
                      extraDot: widget.item.children!.isNotEmpty
                          ? Icon(widget.childrenIcon, size: 6)
                          : null,
                      showDot: widget.item.badgeCount == 0 ? false : true,
                      count: widget.item.badgeCount ?? 0,
                      child: niftileChild,
                    ),
                  ))
              : niftileChild),
    );
  }

  void selectNiftile() {
    setState(() {
      isSelected = !isSelected;
      widget.item.isSelected != null
          ? widget.item.isSelected!(isSelected)
          : () {};
    });
  }
}
