import 'package:floating_tabbar/Models/tab_item.dart';
import 'package:floating_tabbar/Services/platform_check.dart';
import 'package:floating_tabbar/Widgets/floater.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Nautics extends StatefulWidget {
  /// List of items that will show in Nautics sidebar
  final List<TabItem> children;

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
  final Widget? header;

  /// The widget that will be on bottom of Nautics SideBar
  final Widget? footer;

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

  /// Initial index.
  final int initialIndex;

  /// Expanded Nautics Decoration.
  final Decoration? expandedNauticsDecoration;

  /// Collapsed Nautics Decoration.
  final Decoration? collapsedNauticsDecoration;

  /// Space from left for the children udner a TabItem
  final double childIndentation;

  const Nautics({
    Key? key,
    required this.children,
    required this.onChange,
    this.initialIndex = 0,
    this.header,
    this.footer,
    this.nauticsColor,
    this.selectedColor,
    this.unSelectedColor,
    this.collapsedNauticsDecoration,
    this.expandedNauticsDecoration,
    this.collapsedWidth = 60,
    this.childIndentation = 30,
    this.expandedWidth = 200,
    this.isCollapsed = true,
    this.isFloating = true,
    this.isConvertible = true,
    this.crossAxisAlignmentCollapsedForm = CrossAxisAlignment.center,
    this.crossAxisAlignmentExpandedForm = CrossAxisAlignment.center,
    this.mainAxisAlignmentCollapsedForm = MainAxisAlignment.start,
    this.mainAxisAlignmentExpandedForm = MainAxisAlignment.start,
    this.selectedTrailingIcon = const Icon(CupertinoIcons.arrow_up_arrow_down, size: 15),
    this.unSelectedTrailingIcon = const Icon(CupertinoIcons.arrow_up_arrow_down, size: 15),
  }) : super(key: key);

  @override
  NauticsState createState() => NauticsState();
}

class NauticsState extends State<Nautics> {
  ValueNotifier<int>? itemChildSelected;
  bool isNauticsExpanded = false;
  bool isExpansionTileSelected = false;

  @override
  void initState() {
    itemChildSelected = ValueNotifier<int>(widget.initialIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    Size size = MediaQuery.of(context).size;
    String platform = PlatformCheck().platformCheck(context: context);

    if (widget.isConvertible) {
      if (isNauticsExpanded) {
        return nauticsTiles(brightness: brightness);
      } else {
        return nauticsIcons(
          size: size,
          platform: platform,
          brightness: brightness,
        );
      }
    } else {
      if (widget.isCollapsed) {
        return nauticsIcons(
          size: size,
          platform: platform,
          brightness: brightness,
        );
      } else {
        return nauticsTiles(brightness: brightness);
      }
    }
  }

  Widget nauticsTiles({required Brightness brightness}) {
    Container nauticsTiles = Container(
      width: widget.expandedWidth,
      color: widget.isFloating == true ? null : widget.nauticsColor ?? (brightness == Brightness.dark ? Colors.black : Colors.white),
      child: Container(
        decoration: widget.expandedNauticsDecoration,
        child: Column(
          mainAxisAlignment: widget.mainAxisAlignmentExpandedForm,
          crossAxisAlignment: widget.crossAxisAlignmentExpandedForm,
          children: [
            widget.header == null ? Container() : headerTile(),
            Expanded(
              child: ListTileTheme(
                selectedColor: widget.selectedColor ?? Theme.of(context).primaryColor,
                child: ListView.builder(
                  itemCount: widget.children.length,
                  itemBuilder: (BuildContext context, int index) {
                    TabItem tI = widget.children[index];
                    return tabTile(
                      tabItem: tI,
                      context: context,
                      brightness: brightness,
                      index: index,
                      itemChildSelected: itemChildSelected!,
                      isLevelOne: true,
                    );
                  },
                ),
              ),
            ),
            widget.footer == null ? Container() : footerTile(),
          ],
        ),
      ),
    );
    return GestureDetector(
      onTap: transformNautics,
      child: widget.isFloating == true
          ? Floater(
              backgroundColor: widget.nauticsColor ?? (brightness == Brightness.dark ? Colors.black : Colors.white),
              child: nauticsTiles,
            )
          : nauticsTiles,
    );
  }

  Widget tabTile({
    required TabItem tabItem,
    required BuildContext context,
    required Brightness brightness,
    required int index,
    required ValueNotifier<int> itemChildSelected,
    bool isLevelOne = false,
  }) {
    ValueNotifier<int> icSelected = ValueNotifier<int>(-1);
    return ListTileTheme(
      selectedColor: widget.selectedColor ?? Theme.of(context).primaryColor,
      child: tabItem.children!.isEmpty
          ? Container(
              margin: isLevelOne == true ? null : EdgeInsets.only(left: widget.childIndentation),
              child: ListTile(
                onTap: () {
                  tabItem.onTap!();
                  setState(() {
                    itemChildSelected.value = index;
                    widget.onChange(itemChildSelected.value);
                  });
                },
                selected: itemChildSelected.value == index,
                dense: true,
                iconColor: (brightness == Brightness.dark ? Colors.black : Colors.white),
                textColor: (brightness == Brightness.dark ? Colors.black : Colors.white),
                leading: tabItem.selectedLeadingIcon,
                title: tabItem.title,
                subtitle: tabItem.subTitle,
                trailing: tabItem.trailingIcon,
              ),
            )
          : Container(
              margin: isLevelOne == true ? null : EdgeInsets.only(left: widget.childIndentation),
              child: ExpansionTile(
                onExpansionChanged: (isSelected) {
                  setState(() {
                    isExpansionTileSelected = isSelected;
                    itemChildSelected.value = index;
                    icSelected.value = index;
                    widget.onChange(icSelected.value);
                  });
                },
                iconColor: widget.selectedColor ?? Theme.of(context).primaryColor,
                textColor: widget.selectedColor ?? Theme.of(context).primaryColor,
                collapsedIconColor: icSelected.value == index ? widget.selectedColor ?? Theme.of(context).primaryColor : (brightness == Brightness.dark ? Colors.black : Colors.white),
                collapsedTextColor: icSelected.value == index ? widget.selectedColor ?? Theme.of(context).primaryColor : (brightness == Brightness.dark ? Colors.black : Colors.white),
                title: tabItem.title,
                maintainState: true,
                initiallyExpanded: isExpansionTileSelected ? true : false,
                subtitle: tabItem.subTitle,
                leading: tabItem.selectedLeadingIcon,
                trailing: tabItem.trailingIcon != null
                    ? SizedBox(
                        width: 75,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: 50,
                              child: ListView(
                                reverse: true,
                                scrollDirection: Axis.horizontal,
                                children: [tabItem.trailingIcon ?? Container()],
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(child: isExpansionTileSelected ? widget.selectedTrailingIcon! : widget.unSelectedTrailingIcon!),
                          ],
                        ),
                      )
                    : isExpansionTileSelected
                        ? widget.selectedTrailingIcon!
                        : widget.unSelectedTrailingIcon!,
                children: tabExpansionTile(
                  tabItem: tabItem,
                  context: context,
                  brightness: brightness,
                  itemChildSelected: icSelected,
                ),
              ),
            ),
    );
  }

  List<Widget> tabExpansionTile({
    required TabItem tabItem,
    required BuildContext context,
    required Brightness brightness,
    required ValueNotifier<int> itemChildSelected,
  }) {
    return List.generate(
      tabItem.children!.length,
      (index) {
        TabItem childTI = tabItem.children![index];
        return ListTileTheme(
          selectedColor: widget.selectedColor ?? Theme.of(context).primaryColor,
          child: tabTile(
            tabItem: childTI,
            context: context,
            brightness: brightness,
            index: index,
            itemChildSelected: itemChildSelected,
          ),
        );
      },
    );
  }

  Widget nauticsIcons({required Size size, required String platform, required Brightness brightness}) {
    AnimatedContainer animatedContainer = AnimatedContainer(
      duration: const Duration(seconds: 1),
      curve: Curves.easeInBack,
      width: widget.collapsedWidth,
      color: widget.isFloating == true ? null : widget.nauticsColor ?? (brightness == Brightness.dark ? Colors.black : Colors.white),
      child: Container(
        decoration: widget.collapsedNauticsDecoration,
        child: Column(
          mainAxisAlignment: widget.mainAxisAlignmentCollapsedForm,
          crossAxisAlignment: widget.crossAxisAlignmentCollapsedForm,
          children: [
            widget.header == null ? Container() : headerIcon(),
            Expanded(
              child: ListView.builder(
                itemCount: widget.children.length,
                itemBuilder: (contex, index) {
                  TabItem tI = widget.children[index];
                  return InkWell(
                    onTap: () => {
                      setState(() {
                        itemChildSelected!.value = index;
                      }),
                      tI.children!.isEmpty
                          ? isNauticsExpanded = false
                          : {
                              transformNautics(),
                              setState(() {
                                isExpansionTileSelected = true;
                              }),
                            },
                      tI.onTap!(),
                      widget.onChange(itemChildSelected!.value),
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // color: itemChildSelected!.value == index ? (widget.selectedColor ?? Theme.of(context).primaryColor) : (widget.unSelectedColor),
                        color: itemChildSelected!.value == index ? (widget.selectedColor ?? Theme.of(context).primaryColor) : Colors.transparent,
                      ),
                      height: 45,
                      width: 45,
                      alignment: Alignment.center,
                      child: tI.selectedLeadingIcon,
                    ),
                  );
                },
              ),
            ),
            widget.footer == null ? Container() : footerIcon(),
          ],
        ),
      ),
    );
    return GestureDetector(
      onTap: transformNautics,
      child: widget.isFloating == true
          ? Floater(
              backgroundColor: widget.nauticsColor ?? (brightness == Brightness.dark ? Colors.black : Colors.white),
              child: animatedContainer,
            )
          : animatedContainer,
    );
  }

  Widget headerTile() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: ListTile(
        title: Center(child: widget.header),
        onTap: transformNautics,
      ),
    );
  }

  Widget headerIcon() {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      margin: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: transformNautics,
        child: Container(
          height: 45,
          alignment: Alignment.center,
          child: widget.header,
        ),
      ),
    );
  }

  Widget footerTile() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: ListTile(
        title: Center(child: widget.footer),
        onTap: transformNautics,
      ),
    );
  }

  Widget footerIcon() {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      margin: const EdgeInsets.only(top: 8),
      child: InkWell(
        onTap: transformNautics,
        child: Container(
          height: 45,
          alignment: Alignment.center,
          child: widget.footer,
        ),
      ),
    );
  }

  void transformNautics() => setState(() => isNauticsExpanded = !isNauticsExpanded);
}
