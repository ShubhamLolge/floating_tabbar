library floating_tabbar;

import 'package:floating_tabbar/Models/tab_item.dart';
import 'package:floating_tabbar/Services/platform_check.dart';
import 'package:floating_tabbar/Widgets/floater.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FloatingTabBarPageView extends StatefulWidget {
  final List<TabItem> tabItemList;
  final String title;
  final AppBar? parentAppbar;
  final bool? isFloating;
  final bool? showTabNameForNonFloating;
  final bool? showTabNameForFloating;
  final Color indicatorColor;
  final Color activeColor;
  final Color inactiveColor;
  final Color backgroundColor;
  final Widget titleTapNavigationRouteWidget;

  const FloatingTabBarPageView({
    Key? key,
    required this.tabItemList,
    required this.title,
    required this.titleTapNavigationRouteWidget,
    this.parentAppbar,
    this.indicatorColor = Colors.black12,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.blue,
    this.backgroundColor = Colors.transparent,
    this.isFloating = true,
    this.showTabNameForNonFloating = false,
    this.showTabNameForFloating = false,
  }) : super(key: key);
  @override
  _FloatingTabBarPageViewState createState() => _FloatingTabBarPageViewState();
}

class _FloatingTabBarPageViewState extends State<FloatingTabBarPageView> {
  PageController floatingTabBarPageViewController = PageController(initialPage: 0);
  final ValueNotifier<double> playerExpandProgress = ValueNotifier(76);
  bool isExtended = false;
  bool isFloatingBarHidden = false;
  int _selectedIndex = 0;

  List<BottomNavigationBarItem> getBottomNavigationBarItemIcon({required bool showTabName}) {
    List<BottomNavigationBarItem> _bottomNavigationBarItemiconList = [];
    for (var element in widget.tabItemList) {
      _bottomNavigationBarItemiconList.add(
        BottomNavigationBarItem(
          icon: element.icon,
          activeIcon: element.selectedIcon,
          label: showTabName ? element.label : null,
        ),
      );
    }
    return _bottomNavigationBarItemiconList;
  }

  List<NavigationRailDestination> getNavigationRailDestinationList() {
    List<NavigationRailDestination> _list = [];
    for (var element in widget.tabItemList) {
      _list.add(NavigationRailDestination(
        icon: element.icon,
        selectedIcon: element.selectedIcon,
        label: Text(element.label),
      ));
    }
    return _list;
  }

  List<Widget> getTabScreenList() {
    List<Widget> _tabScreenList = [];
    for (var element in widget.tabItemList) {
      _tabScreenList.add(element.tabWidget);
    }
    return _tabScreenList;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      floatingTabBarPageViewController.animateToPage(index, duration: const Duration(milliseconds: 400), curve: Curves.ease);
    });
  }

  Widget floatingActionButtonBar() {
    Widget floatingBottomBar(value) {
      return SizedBox(
        height: 60 * (MediaQuery.of(context).size.height - value) / (MediaQuery.of(context).size.height - 50),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 50),
          child: Material(
            borderRadius: BorderRadius.circular(50),
            elevation: 35,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: CupertinoTabBar(
                border: const Border(
                  bottom: BorderSide.none,
                  left: BorderSide.none,
                  right: BorderSide.none,
                  top: BorderSide.none,
                ),
                currentIndex: _selectedIndex,
                iconSize: 35,
                items: getBottomNavigationBarItemIcon(showTabName: widget.showTabNameForFloating!),
                onTap: (index) {
                  _onItemTapped(index);
                },
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

  CupertinoTabBar nonFloatingBottomBar() {
    return CupertinoTabBar(
      border: const Border(
        bottom: BorderSide.none,
        left: BorderSide.none,
        right: BorderSide.none,
        top: BorderSide.none,
      ),
      currentIndex: _selectedIndex,
      items: getBottomNavigationBarItemIcon(showTabName: widget.showTabNameForNonFloating!),
      onTap: (index) {
        _onItemTapped(index);
      },
      activeColor: widget.activeColor,
      inactiveColor: widget.inactiveColor,
      backgroundColor: widget.backgroundColor,
    );
  }

  Scaffold buildScafoldForFloatingTabBar() {
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
      floatingActionButton: isFloatingBarHidden ? Container() : floatingActionButtonBar(),
    );
  }

  Scaffold buildScafoldForBottomBar() {
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
      bottomNavigationBar: nonFloatingBottomBar(),
    );
  }

  Scaffold buildScaffoldForWeb() {
    return Scaffold(
      appBar: widget.parentAppbar,
      body: SafeArea(
        child: Row(
          children: <Widget>[
            Floater(
              widget: Container(
                color: Colors.white,
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                height: MediaQuery.of(context).size.height * 0.99,
                child: NavigationRail(
                  selectedIndex: _selectedIndex,
                  onDestinationSelected: (int index) {
                    _onItemTapped(index);
                    setState(() => _selectedIndex = index);
                  },
                  leading: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: GestureDetector(
                          onTap: () => setState(() => isExtended = !isExtended),
                          child: Icon(isExtended ? Icons.arrow_back_ios_new_rounded : Icons.arrow_forward_ios_rounded),
                        ),
                      ),
                      isExtended
                          ? GestureDetector(
                              onTap: () => Navigator.of(context)
                                  .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => widget.titleTapNavigationRouteWidget), (route) => false),
                              child: Text(widget.title, style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 20)),
                            )
                          : Container(),
                    ],
                  ),
                  extended: isExtended,
                  useIndicator: true,
                  indicatorColor: widget.indicatorColor,
                  minExtendedWidth: MediaQuery.of(context).size.width * 0.15,
                  labelType: NavigationRailLabelType.none,
                  destinations: getNavigationRailDestinationList(),
                ),
              ),
            ),
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                onPageChanged: (indx) => setState(() => _selectedIndex = indx),
                controller: floatingTabBarPageViewController,
                children: getTabScreenList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    PlatformCheck platFormCheck = PlatformCheck();
    var platform = platFormCheck.platformCheck(context: context);
    debugPrint("Platform: $platform");

    return platform == "Web Desktop" || platform == "Web Tablet" || platform == "Windows"
        ? buildScaffoldForWeb()
        : (widget.isFloating! ? buildScafoldForFloatingTabBar() : buildScafoldForBottomBar());
  }
}
