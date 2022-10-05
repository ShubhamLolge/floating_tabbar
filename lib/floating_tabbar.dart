library floating_tabbar;

import 'package:floating_tabbar/Models/tab_item.dart';
import 'package:floating_tabbar/Services/platform_check.dart';
import 'package:floating_tabbar/Widgets/badge_wraper.dart';
import 'package:floating_tabbar/Widgets/nautics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FloatingTabBar extends StatefulWidget {
  /// List of "TabItem" which will be shown on naigation bar
  final List<TabItem> tabItemList;

  /// Leading widget
  final Widget? leading;

  /// A "AppBar?" widget that will be shown to all the platforms which has true boolean value as top appbar.
  final AppBar? parentAppbar;

  /// The default value "true" will show floating TabBar, "false" value will show normal bottom navigation bar
  final bool? isFloating;

  /// Use Nautics sidebar instead of navigation rail for large screens when true, default values from FloatingTabbar will be dispayed in Nautics.
  final bool? useNautics;

  /// Shows Labels for Non-Floating type
  final bool? showTabLabelsForNonFloating;

  /// Shows Labels for Floating type
  final bool? showTabLabelsForFloating;

  /// Widget indicator color shows a circle around widget, default : Colors.transparent
  final Color? indicatorColor;

  /// Widget activeColor color, default : primary color
  final Color? activeColor;

  /// Widget inactiveColor color, default : primary color
  final Color? inactiveColor;

  /// Widget backgroundColor color, default : Colors.transparent
  final Color? backgroundColor;

  /// Indicator around the widget
  final bool? useIndicator;

  /// Minimum extension width for NavigationRail which is used in large screens.
  final double? minExtendedWidth;

  const FloatingTabBar({
    Key? key,
    required this.tabItemList,
    this.parentAppbar,
    this.minExtendedWidth = 200,
    this.useIndicator,
    this.leading = const Text("Leading"),
    this.indicatorColor,
    this.activeColor,
    this.inactiveColor,
    this.backgroundColor,
    this.isFloating = true,
    this.useNautics = false,
    this.showTabLabelsForNonFloating = false,
    this.showTabLabelsForFloating = false,
  }) : super(key: key);
  @override
  _FloatingTabBarState createState() => _FloatingTabBarState();
}

class _FloatingTabBarState extends State<FloatingTabBar> {
  PageController floatingTabBarPageViewController = PageController(initialPage: 0);
  final ValueNotifier<double> playerExpandProgress = ValueNotifier(76);
  bool isExtended = false;
  int _selectedIndex = 0;

  List<BottomNavigationBarItem> getBottomNavigationBarItemIconWithBadge({required bool showTabLabels}) {
    List<BottomNavigationBarItem> _bottomNavigationBarItemiconList = [];
    for (var element in widget.tabItemList) {
      Text? title = element.title as Text;
      String? titleString = title.data;
      _bottomNavigationBarItemiconList.add(
        BottomNavigationBarItem(
          icon: BadgeWraper(
              child: element.selectedIcon, showBadge: element.showBadge!, badgeCount: element.badgeCount),
          activeIcon: BadgeWraper(
              child: element.selectedIcon, showBadge: element.showBadge!, badgeCount: element.badgeCount),
          label: showTabLabels ? titleString : null,
        ),
      );
    }
    return _bottomNavigationBarItemiconList;
  }

  List<NavigationRailDestination> getNavigationRailDestinationListWithBadge() {
    List<NavigationRailDestination> _list = [];
    for (var element in widget.tabItemList) {
      _list.add(NavigationRailDestination(
        icon: BadgeWraper(
          showBadge: element.showBadge!,
          badgeCount: element.badgeCount,
          child: SizedBox(
            height: 40,
            width: 40,
            child: element.selectedIcon,
          ),
        ),
        selectedIcon: BadgeWraper(
          showBadge: element.showBadge!,
          badgeCount: element.badgeCount,
          child: SizedBox(
            height: 40,
            width: 40,
            child: element.selectedIcon,
          ),
        ),
        label: element.title,
      ));
    }
    return _list;
  }

  List<Widget> getTabScreenList() {
    List<Widget> _tabScreenList = [];
    for (var element in widget.tabItemList) {
      _tabScreenList.add(element.tabWidget!);
    }
    return _tabScreenList;
  }

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
      floatingTabBarPageViewController.animateToPage(index,
          duration: const Duration(milliseconds: 400), curve: Curves.ease);
    });
  }

  Widget floatingActionButtonBar({required Brightness brightness}) {
    Widget floatingBottomBar(value) {
      return SizedBox(
        height: 60 * (MediaQuery.of(context).size.height - value) / (MediaQuery.of(context).size.height - 50),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 50),
          child: Material(
            borderRadius: BorderRadius.circular(50),
            elevation: 35,
            color: (brightness == Brightness.dark ? Colors.black : Colors.white),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: CupertinoTabBar(
                backgroundColor: (brightness == Brightness.dark ? Colors.black : Colors.white),
                border: const Border(
                  bottom: BorderSide.none,
                  left: BorderSide.none,
                  right: BorderSide.none,
                  top: BorderSide.none,
                ),
                currentIndex: _selectedIndex,
                iconSize: 35,
                items:
                    getBottomNavigationBarItemIconWithBadge(showTabLabels: widget.showTabLabelsForFloating!),
                onTap: (index) => _onItemTap(index),
                activeColor: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      );
    }

    return ValueListenableBuilder(
      valueListenable: playerExpandProgress,
      builder: (BuildContext context, double value, _) {
        return floatingBottomBar(value);
      },
    );
  }

  CupertinoTabBar nonFloatingBottomBar({required Brightness brightness}) {
    return CupertinoTabBar(
      border: const Border(
        bottom: BorderSide.none,
        left: BorderSide.none,
        right: BorderSide.none,
        top: BorderSide.none,
      ),
      currentIndex: _selectedIndex,
      items: getBottomNavigationBarItemIconWithBadge(showTabLabels: widget.showTabLabelsForNonFloating!),
      onTap: (index) {
        _onItemTap(index);
      },
      activeColor: widget.activeColor ?? Theme.of(context).primaryColor,
      inactiveColor: widget.inactiveColor ?? (brightness == Brightness.dark ? Colors.white : Colors.black),
      backgroundColor:
          widget.backgroundColor ?? (brightness == Brightness.dark ? Colors.black : Colors.white),
    );
  }

  Scaffold buildScafoldForFloatingTabBar({required String platform, required Brightness brightness}) {
    return Scaffold(
      appBar: widget.parentAppbar,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                onPageChanged: (indx) => setState(() => _selectedIndex = indx),
                controller: floatingTabBarPageViewController,
                children: getTabScreenList(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: floatingActionButtonBar(brightness: brightness),
    );
  }

  Scaffold buildScafoldForBottomBar({required String platform, required Brightness brightness}) {
    return Scaffold(
      appBar: widget.parentAppbar,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (indx) => setState(() => _selectedIndex = indx),
                controller: floatingTabBarPageViewController,
                children: getTabScreenList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: nonFloatingBottomBar(brightness: brightness),
    );
  }

  Scaffold buildScaffoldForWeb(
      {required String platform, bool? isFloating = true, required Brightness brightness}) {
    NavigationRail navigationRail = NavigationRail(
      selectedIndex: _selectedIndex,
      onDestinationSelected: (int index) {
        _onItemTap(index);
        setState(() => _selectedIndex = index);
      },
      backgroundColor:
          widget.backgroundColor ?? (brightness == Brightness.dark ? Colors.black : Colors.white),
      leading: widget.leading,
      extended: isExtended,
      selectedLabelTextStyle: TextStyle(color: widget.activeColor ?? Theme.of(context).primaryColor),
      selectedIconTheme: IconThemeData(color: widget.activeColor ?? Theme.of(context).primaryColor),
      unselectedLabelTextStyle: TextStyle(
        color: widget.inactiveColor ?? (brightness == Brightness.dark ? Colors.white : Colors.black),
      ),
      unselectedIconTheme: IconThemeData(
        color: widget.inactiveColor ?? (brightness == Brightness.dark ? Colors.white : Colors.black),
      ),
      useIndicator: widget.useIndicator ?? false,
      indicatorColor: widget.indicatorColor ?? Theme.of(context).primaryColor.withOpacity(0.2),
      minExtendedWidth: widget.minExtendedWidth ?? MediaQuery.of(context).size.width * 0.14,
      labelType: NavigationRailLabelType.none,
      destinations: getNavigationRailDestinationListWithBadge(),
    );

    Nautics nautics = Nautics(
      onChange: (index) {
        _onItemTap(index);
        setState(() => _selectedIndex = index);
      },
      selectedColor: widget.activeColor,
      unSelectedColor: widget.inactiveColor,
      selectedIndex: _selectedIndex,
      nauticsItems: widget.tabItemList,
      isFloating: widget.isFloating,
    );

    return Scaffold(
      appBar: widget.parentAppbar,
      body: Row(
        children: [
          widget.useNautics == true
              ? nautics
              : isFloating == true
                  ? GestureDetector(
                      onTap: () => setState(() => isExtended = !isExtended),
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        child: Material(
                          elevation: 10,
                          borderRadius: BorderRadius.circular(10),
                          child: ClipRRect(borderRadius: BorderRadius.circular(10), child: navigationRail),
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () => setState(() => isExtended = !isExtended), child: navigationRail),
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              onPageChanged: (index) => setState(() => _selectedIndex = index),
              controller: floatingTabBarPageViewController,
              children: getTabScreenList(),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    PlatformCheck platFormCheck = PlatformCheck();
    var platform = platFormCheck.platformCheck(context: context);
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    debugPrint("Platform: $platform");

    return platform == "Web Desktop" || platform == "Web Tablet" || platform == "Windows"
        ? buildScaffoldForWeb(platform: platform, isFloating: widget.isFloating, brightness: brightness)
        : (widget.isFloating!
            ? buildScafoldForFloatingTabBar(platform: platform, brightness: brightness)
            : buildScafoldForBottomBar(platform: platform, brightness: brightness));
  }
}
