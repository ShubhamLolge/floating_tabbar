# Floating TabBar

The floating_tabbar package for Flutter allows you to use the responsive design for all platforms made from the Material Design System.

# View package

https://pub.dev/packages/floating_tabbar


## Getting started

Import the package and use it in your Flutter App.
```dart
import 'package:floating_tabbar/floating_tabbar.dart';
```

 * This is Floating TabBar widget.
 * To use this there must be minimum two items.
 * You get TabBar floating and a PageView with it.
 * And with [isFloating = false] you'll get normal TabBar PageView
 * Support for all device sizes.

## Add themes
```dart
// floating_tabbar is now light and dark theme compatible.
// Add basic themes to your app, so that floating_tabbar could glow in both light and dark themes.
MaterialApp(
  themeMode: ThemeMode.system,
  theme: ThemeData(
    primaryColor: Colors.blue,
    brightness: Brightness.light,
    canvasColor: Colors.grey[50],
  ),
  darkTheme: ThemeData(
    primaryColor: Colors.blue,
    brightness: Brightness.dark,
    canvasColor: const Color.fromARGB(255, 37, 37, 37),
  ),
),
```

## Usage
```dart
// HOW TO USE THIS WIDGET

  List<TabItem> topTabbarTabItemlist({required Brightness brightness}) {
    List<TabItem> topTabbarTabItemlist = [
      TabItem(
        onTap: () {},
        title: const Text("Nautics SideBar"),
        tabWidget: const Center(child: Text("Nautics SideBar", style: TextStyle(fontSize: 30))),
      ),
      TabItem(
        onTap: () {},
        title: const Text("Public Events"),
        tabWidget: const Center(child: Text("Public Events", style: TextStyle(fontSize: 30))),
      ),
    ];
    return topTabbarTabItemlist;
  }

  Widget floatingTabBarPageView({required Brightness brightness}) {
    List<TabItem> tabList() {
      List<TabItem> _list = [
        TabItem(
          onTap: () {},
          selectedIcon: const Icon(Icons.dashboard),
          title: const Text("Dashboard"),
          tabWidget: TopTabbar(tabList: topTabbarTabItemlist(brightness: brightness)),
          showBadge: true,
          badgeCount: 10,
        ),
        TabItem(
          onTap: () {},
          selectedIcon: const Icon(Icons.library_books),
          title: const Text("Report"),
          tabWidget: const Center(child: Text("Report", style: TextStyle(fontSize: 30))),
        ),
        TabItem(
          onTap: () {},
          selectedIcon: const Icon(Icons.settings),
          title: const Text("Settings"),
          tabWidget: const Center(child: Text("Settings", style: TextStyle(fontSize: 30))),
        ),
        TabItem(
          title: const Text("Work"),
          onTap: () {},
          selectedIcon: const Icon(Icons.maps_home_work_sharp),
          tabWidget: const Center(child: Text("Work", style: TextStyle(fontSize: 30))),
        ),
        TabItem(
          title: const Text("ShowCase"),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ShowCase()));
          },
          selectedIcon: const Icon(Icons.flight_rounded),
          tabWidget: const Center(child: Text("ShowCase", style: TextStyle(fontSize: 30))),
        ),
      ];
      return _list;
    }


    FloatingTabBar(
      tabItemList: tabList(),
      useNautics: true,
    );

```

## Additional information

![1](https://user-images.githubusercontent.com/75387392/184212839-57872c36-eeb9-40aa-ac3f-3b41b718c7a4.png)

![2](https://user-images.githubusercontent.com/75387392/184212823-3f10015d-727a-4e6a-9adc-feeb4b3e76e3.png)

![3](https://user-images.githubusercontent.com/75387392/184212829-be03551d-ea02-410b-80b7-1d681a161975.png)

<!-- <p float="left">
  <img src=![1](https://user-images.githubusercontent.com/75387392/184212839-57872c36-eeb9-40aa-ac3f-3b41b718c7a4.png) width="100" />
  <img src=![2](https://user-images.githubusercontent.com/75387392/184212823-3f10015d-727a-4e6a-9adc-feeb4b3e76e3.png) width="100" /> 
  <img src=![3](https://user-images.githubusercontent.com/75387392/184212829-be03551d-ea02-410b-80b7-1d681a161975.png) width="100" />
</p> -->

and much more.
