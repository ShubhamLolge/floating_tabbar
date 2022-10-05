import 'package:floating_tabbar/Models/tab_item.dart';
import 'package:floating_tabbar/Services/platform_check.dart';
import 'package:floating_tabbar/Widgets/floater.dart';
import 'package:flutter/material.dart';

class Nautics extends StatefulWidget {
  /// List of items that will show in Nautics sidebar
  final List<TabItem> nauticsItems;

  /// Default true, Nautics SideBar expands and collapses on click.
  final bool isConvertible;

  /// Width for collapsed form of Nautics SideBar, default = 60.
  final double collapsedWidth;

  /// Width for expanded form of Nautics SideBar, default = 200.
  final double expandedWidth;

  /// The default value "true" will show floating Nautics SideBar.
  final bool? isFloating;

  /// Form of Nautics SideBar, default true, and works only for false value of isConvertible
  final bool isCollapsed;

  /// The widget that will be on starting of Nautics SideBar
  final Widget? nauticHeaderWidget;

  /// The widget that will be on bottom of Nautics SideBar
  final Widget? nauticFooterWidget;

  /// Color for Nautics SideBar
  final Color? nauticsColor;

  /// Color for selected item
  final Color? selectedColor;

  /// Color for un-selected item
  final Color? unSelectedColor;

  /// CrossAxisAlignment for expanded form
  final CrossAxisAlignment crossAxisAlignmentExpandedForm;

  /// MainAxisAlignment for expanded form
  final MainAxisAlignment mainAxisAlignmentExpandedForm;

  /// CrossAxisAlignment for collapsed form
  final CrossAxisAlignment crossAxisAlignmentCollapsedForm;

  /// MainAxisAlignment for collapsed form
  final MainAxisAlignment mainAxisAlignmentCollapsedForm;

  /// Selected icon for trailing on NauticsItemChildren tile.
  final Widget? selectedTrailingIcon;

  /// Un-selected icon for trailing on NauticsItemChildren tile.
  final Widget? unSelectedTrailingIcon;

  /// On index change.
  final ValueChanged<int> onChange;

  /// Selected index.
  final int selectedIndex;

  const Nautics({
    Key? key,
    required this.nauticsItems,
    required this.onChange,
    this.selectedIndex = 0,
    this.nauticHeaderWidget = const Text("Header"),
    this.nauticFooterWidget = const Text("Footer"),
    this.nauticsColor,
    this.selectedColor,
    this.unSelectedColor,
    this.collapsedWidth = 60,
    this.expandedWidth = 200,
    this.isCollapsed = true,
    this.isFloating = true,
    this.isConvertible = true,
    this.crossAxisAlignmentCollapsedForm = CrossAxisAlignment.center,
    this.crossAxisAlignmentExpandedForm = CrossAxisAlignment.center,
    this.mainAxisAlignmentCollapsedForm = MainAxisAlignment.start,
    this.mainAxisAlignmentExpandedForm = MainAxisAlignment.start,
    this.selectedTrailingIcon = const Icon(Icons.keyboard_arrow_up),
    this.unSelectedTrailingIcon = const Icon(Icons.keyboard_arrow_down),
  }) : super(key: key);

  @override
  NauticsState createState() => NauticsState();
}

class NauticsState extends State<Nautics> {
  bool isExpanded = false;
  bool isExpansionTileSelected = false;
  int itemChildSelected = 0;

  @override
  Widget build(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    Size size = MediaQuery.of(context).size;
    String platform = PlatformCheck().platformCheck(context: context);
    return widget.isConvertible
        ? (isExpanded
            ? nauticsTiles(brightness: brightness)
            : nauticsIcons(
                size: size,
                platform: platform,
                brightness: brightness,
              ))
        : widget.isCollapsed
            ? nauticsIcons(
                size: size,
                platform: platform,
                brightness: brightness,
              )
            : nauticsTiles(brightness: brightness);
  }

  /// This show tiles when Nautics SideBar is in expanded form
  Widget nauticsTiles({required Brightness brightness}) {
    Container nauticsTiles = Container(
      width: widget.expandedWidth,
      color: widget.isFloating == true
          ? null
          : widget.nauticsColor ?? (brightness == Brightness.dark ? Colors.black : Colors.white),
      child: Column(
        mainAxisAlignment: widget.mainAxisAlignmentExpandedForm,
        crossAxisAlignment: widget.crossAxisAlignmentExpandedForm,
        children: [
          widget.nauticHeaderWidget == null ? Container() : headerTile(brightness: brightness),
          Expanded(
            child: ListTileTheme(
              selectedColor: widget.selectedColor ?? Theme.of(context).primaryColor,
              child: ListView.builder(
                itemCount: widget.nauticsItems.length,
                itemBuilder: (BuildContext context, int index) {
                  TabItem tI = widget.nauticsItems[index];
                  bool selected = widget.selectedIndex == index;
                  return tI.tabItemChildren!.isEmpty
                      ? ListTile(
                          selected: selected ? true : false,
                          iconColor: widget.unSelectedColor ??
                              (brightness == Brightness.dark ? Colors.white : Colors.black),
                          textColor: widget.unSelectedColor ??
                              (brightness == Brightness.dark ? Colors.white : Colors.black),
                          onTap: () {
                            widget.onChange(index);
                            tI.onTap!();
                          },
                          leading: tI.selectedIcon,
                          trailing: tI.trailing,
                          title: tI.title,
                          subtitle: tI.subTitle,
                        )
                      : ExpansionTile(
                          collapsedIconColor: widget.unSelectedColor ??
                              (brightness == Brightness.dark ? Colors.white : Colors.black),
                          collapsedTextColor: widget.unSelectedColor ??
                              (brightness == Brightness.dark ? Colors.white : Colors.black),
                          iconColor: widget.selectedColor ?? Theme.of(context).primaryColor,
                          textColor: widget.selectedColor ?? Theme.of(context).primaryColor,
                          onExpansionChanged: (isSelected) {
                            widget.onChange(index);
                            setState(() => isExpansionTileSelected = isSelected);
                          },
                          title: tI.title,
                          maintainState: true,
                          initiallyExpanded: isExpansionTileSelected ? true : false,
                          subtitle: tI.subTitle,
                          leading: tI.selectedIcon,
                          trailing: isExpansionTileSelected
                              ? widget.selectedTrailingIcon
                              : widget.unSelectedTrailingIcon,
                          children: List.generate(
                            tI.tabItemChildren!.length,
                            (index) {
                              bool isItemChildSelected = itemChildSelected == index;
                              return ListTileTheme(
                                selectedColor: widget.selectedColor ?? Theme.of(context).primaryColor,
                                child: ListTile(
                                  onTap: () => {
                                    tI.tabItemChildren![index].onTap!(),
                                    setState(() {
                                      itemChildSelected = index;
                                      isItemChildSelected = !isItemChildSelected;
                                    }),
                                  },
                                  dense: true,
                                  selected: isItemChildSelected ? true : false,
                                  leading: tI.tabItemChildren![index].selectedIcon,
                                  title: tI.tabItemChildren![index].title,
                                  subtitle: tI.tabItemChildren![index].subTitle,
                                  trailing: tI.tabItemChildren![index].trailing,
                                ),
                              );
                            },
                          ),
                        );
                },
              ),
            ),
          ),
          widget.nauticFooterWidget == null ? Container() : footerTile(brightness: brightness),
        ],
      ),
    );
    return GestureDetector(
      onTap: transformNautics,
      child: widget.isFloating == true
          ? Floater(
              backgroundColor:
                  widget.nauticsColor ?? (brightness == Brightness.dark ? Colors.black : Colors.white),
              child: nauticsTiles,
            )
          : nauticsTiles,
    );
  }

  /// This show icons when Nautics SideBar is in collapsed form
  Widget nauticsIcons({required Size size, required String platform, required Brightness brightness}) {
    AnimatedContainer animatedContainer = AnimatedContainer(
      duration: const Duration(seconds: 1),
      curve: Curves.easeInBack,
      width: widget.collapsedWidth,
      color: widget.isFloating == true
          ? null
          : widget.nauticsColor ?? (brightness == Brightness.dark ? Colors.black : Colors.white),
      child: Column(
        mainAxisAlignment: widget.mainAxisAlignmentCollapsedForm,
        crossAxisAlignment: widget.crossAxisAlignmentCollapsedForm,
        children: [
          widget.nauticHeaderWidget == null ? Container() : headerIcon(),
          Expanded(
            child: ListView.builder(
              itemCount: widget.nauticsItems.length,
              itemBuilder: (contex, index) {
                bool selected = widget.selectedIndex == index;
                TabItem tI = widget.nauticsItems[index];
                return InkWell(
                  onTap: () => {
                    tI.tabItemChildren!.isEmpty
                        ? isExpanded = false
                        : {
                            transformNautics(),
                            setState(() {
                              isExpansionTileSelected = true;
                            }),
                          },
                    tI.onTap!(),
                    widget.onChange(index),
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: selected
                          ? (widget.selectedColor ?? Theme.of(context).primaryColor)
                          : (widget.unSelectedColor),
                    ),
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    child: tI.selectedIcon,
                  ),
                );
              },
            ),
          ),
          widget.nauticFooterWidget == null ? Container() : footerIcon(),
        ],
      ),
    );
    return GestureDetector(
      onTap: transformNautics,
      child: widget.isFloating == true
          ? Floater(
              backgroundColor:
                  widget.nauticsColor ?? (brightness == Brightness.dark ? Colors.black : Colors.white),
              child: animatedContainer,
            )
          : animatedContainer,
    );
  }

  /// headerTile
  Widget headerTile({required Brightness brightness}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: ListTile(
        iconColor: (brightness == Brightness.dark ? Colors.white : Colors.black),
        textColor: (brightness == Brightness.dark ? Colors.white : Colors.black),
        title: Center(child: widget.nauticHeaderWidget),
        onTap: transformNautics,
      ),
    );
  }

  /// headerIcon
  Widget headerIcon() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: InkWell(
        onTap: transformNautics,
        child: Container(
          height: 45,
          alignment: Alignment.center,
          child: widget.nauticHeaderWidget,
        ),
      ),
    );
  }

  /// footerTile
  Widget footerTile({required Brightness brightness}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: ListTile(
        iconColor: (brightness == Brightness.dark ? Colors.white : Colors.black),
        textColor: (brightness == Brightness.dark ? Colors.white : Colors.black),
        title: Center(child: widget.nauticFooterWidget),
        onTap: transformNautics,
      ),
    );
  }

  /// footerIcon
  Widget footerIcon() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: InkWell(
        onTap: transformNautics,
        child: Container(
          height: 45,
          alignment: Alignment.center,
          child: widget.nauticFooterWidget,
        ),
      ),
    );
  }

  /// this function changes the form of Nautics SideBar
  void transformNautics() => setState(() => isExpanded = !isExpanded);
}
