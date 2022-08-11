# Floating TabBar

The floating_tabbar package for Flutter allows you to use the responsive design for all platforms made from the Material Design System.

## Getting started

1. Import the package and use it in your Flutter App.
```dart
import 'package:floating_tabbar/floating_tabbar.dart';
```

 * This is Floating TabBar widget.
 * To use this there must be minimum two items.
 * You get TabBar floating and a PageView with it.
 * And with [isFloating = false] you'll get normal TabBar PageView
 * Support for all device sizes.

## Usage

```dart
// HOW TO USE THIS WIDGET

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'floating_tabbar',
      theme: ThemeData(primarySwatch: Colors.red),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<TabItem> topTabbarTabItemlist = const [
    TabItem(
      label: "Reminders",
      tabWidget: Center(child: Text("Reminders", style: TextStyle(fontSize: 30))),
    ),
    TabItem(
      icon: Icon(Icons.settings_outlined, size: 30),
      selectedIcon: Icon(Icons.settings, size: 30),
      label: "Public Events",
      tabWidget: Center(child: Text("Public Events", style: TextStyle(fontSize: 30))),
    ),
  ];

  Widget floatingTabBarPageView() {
    List<TabItem> tabList() {
      List<TabItem> _list = [
        TabItem(
          icon: const Icon(Icons.dashboard_outlined, size: 30),
          selectedIcon: const Icon(Icons.dashboard, size: 30),
          label: "Dashboard",
          tabWidget: TopTabbar(
            tabList: topTabbarTabItemlist,
          ),
          showBadge: true,
          badgeCount: 10,
        ),
        const TabItem(
          icon: Icon(Icons.library_books_outlined, size: 30),
          selectedIcon: Icon(Icons.library_books, size: 30),
          label: "Report",
          tabWidget: Floater(child: Center(child: Text("Report", style: TextStyle(fontSize: 30)))),
        ),
        const TabItem(
          icon: Icon(Icons.settings_outlined, size: 30),
          selectedIcon: Icon(Icons.settings, size: 30),
          label: "Settings",
          tabWidget: Floater(child: Center(child: Text("Settings", style: TextStyle(fontSize: 30)))),
        ),
      ];
      return _list;
    }

    AppBar getAppBar() {
      return AppBar(
        title: Text("Floating Tabbar Pageview", style: TextStyle(color: Theme.of(context).primaryColor)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      );
    }

    return FloatingTabBar(
      activeColor: Colors.green,
      inactiveColor: Colors.yellow,
      tabItemList: tabList(),
      title: "FLOAT",
      isFloating: true,
      parentAppbar: getAppBar(),
      titleTapNavigationRouteWidget: const Scaffold(body: Center(child: Text("App Home"))), /* Put your app home widget here other than landing page. */
    );
  }

  @override
  Widget build(BuildContext context) {
    return floatingTabBarPageView();
  }
}

```

## Additional information

![1](https://user-images.githubusercontent.com/75387392/184212839-57872c36-eeb9-40aa-ac3f-3b41b718c7a4.png)

![2](https://user-images.githubusercontent.com/75387392/184212823-3f10015d-727a-4e6a-9adc-feeb4b3e76e3.png)

![3](https://user-images.githubusercontent.com/75387392/184212829-be03551d-ea02-410b-80b7-1d681a161975.png)

![4](https://user-images.githubusercontent.com/75387392/184212834-d9576bf9-3872-4f23-8988-105603cc5d39.png)

![5](https://user-images.githubusercontent.com/75387392/184212837-a9c9ce8e-bc60-4435-9319-6491351277ad.png)

and much more.
