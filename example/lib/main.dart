import 'package:floating_tabbar/Models/tab_item.dart';
import 'package:floating_tabbar/Widgets/floater.dart';
import 'package:floating_tabbar/Widgets/top_tabbar.dart';
import 'package:floating_tabbar/floating_tabbar.dart';
import 'package:flutter/material.dart';

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
      titleTapNavigationRouteWidget: const Scaffold(body: Center(child: Text("App Home"))), /* Put your app home widget here other than landing page. */
    );
  }

  @override
  Widget build(BuildContext context) {
    return floatingTabBarPageView();
  }
}
