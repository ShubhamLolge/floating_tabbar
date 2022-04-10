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
        ),
        const TabItem(
          icon: Icon(Icons.library_books_outlined, size: 30),
          selectedIcon: Icon(Icons.library_books, size: 30),
          label: "Report",
          tabWidget: Floater(widget: Center(child: Text("Report", style: TextStyle(fontSize: 30)))),
        ),
        const TabItem(
          icon: Icon(Icons.settings_outlined, size: 30),
          selectedIcon: Icon(Icons.settings, size: 30),
          label: "Settings",
          tabWidget: Floater(widget: Center(child: Text("Settings", style: TextStyle(fontSize: 30)))),
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

    return FloatingTabBarPageView(
      tabItemList: tabList(),
      title: "FLOAT",
      isFloating: true,
      parentAppbar: getAppBar(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return floatingTabBarPageView();
  }
}
```

## Additional information

### floating_tabbar-Floating-topbar-appbar-mobile
![floating_tabbar-Floating-topbar-appbar-mobile](https://user-images.githubusercontent.com/75387392/161085632-d96c1d8c-a9bc-4472-afbe-01c1f673b47e.PNG)

### floating_tabbar-Floating-topbar-mobile
![floating_tabbar-Floating-topbar-mobile](https://user-images.githubusercontent.com/75387392/161085640-5a1d1e94-0862-476b-88a6-c52617e64367.PNG)

### floating_tabbar-topbar-mobile
![floating_tabbar-topbar-mobile](https://user-images.githubusercontent.com/75387392/161085643-7860a652-c523-4ce2-bc4e-4aade595b449.PNG)

### floating_tabbar-topbar-web
![floating_tabbar-topbar-web](https://user-images.githubusercontent.com/75387392/161085646-266d7983-4011-4633-92a0-0b72b1d2cc16.PNG)

### floating_tabbar-Floating-topbar-appbar-web
![floating_tabbar-Floating-topbar-appbar-web](https://user-images.githubusercontent.com/75387392/161085639-c716d683-4531-409a-a773-6677bfab2688.PNG)

and much more.
