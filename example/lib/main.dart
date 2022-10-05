// import 'package:floating_tabbar/Models/tab_item.dart';
// import 'package:floating_tabbar/Widgets/floater.dart';
// import 'package:floating_tabbar/Widgets/top_tabbar.dart';
// import 'package:floating_tabbar/floating_tabbar.dart';
// import 'package:flutter/material.dart';

import 'package:floating_tabbar/Models/tab_item.dart';
import 'package:floating_tabbar/Widgets/nautics.dart';
import 'package:floating_tabbar/Widgets/top_tabbar.dart';
import 'package:floating_tabbar/floating_tabbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Floating Tabbar',
      debugShowCheckedModeBanner: false,
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

    return FloatingTabBar(
      tabItemList: tabList(),
      useNautics: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    return floatingTabBarPageView(brightness: brightness);
  }
}

class ShowCase extends StatefulWidget {
  const ShowCase({Key? key}) : super(key: key);

  @override
  State<ShowCase> createState() => _ShowCaseState();
}

class _ShowCaseState extends State<ShowCase> {
  int selectedIndex = 0;
  String text = "Text";
  List<TabItem> nauticsItems() {
    List<TabItem> nauticsItems = [
      TabItem(
        selectedIcon: const Icon(Icons.account_circle_rounded, size: 25),
        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 15),
        title: const Text("Jason Bourne"),
        subTitle: const Text("Associate"),
        onTap: () => setState(() {
          text = "Jason Bourne";
        }),
      ),
      TabItem(
        selectedIcon: const Icon(Icons.toggle_on_outlined),
        onTap: () => setState(() {
          text = "Status";
        }),
        title: const Text("Status"),
        tabItemChildren: [
          TabItem(
            title: const Text("Appear offline"),
            selectedIcon: const Icon(CupertinoIcons.multiply_circle, color: Colors.grey),
            onTap: () => setState(() {
              text = "Appear offline";
            }),
          ),
          TabItem(
            title: const Text("Available"),
            selectedIcon: const Icon(Icons.done_rounded, color: Color.fromARGB(255, 0, 254, 8)),
            onTap: () => setState(() {
              text = "Available";
            }),
          ),
          TabItem(
            title: const Text("Busy"),
            selectedIcon: const Icon(Icons.circle, color: Colors.red),
            onTap: () => setState(() {
              text = "Busy";
            }),
          ),
          TabItem(
            title: const Text("Do not disturb"),
            selectedIcon: const Icon(Icons.remove_circle, color: Colors.red),
            onTap: () => setState(() {
              text = "Do not disturb";
            }),
          ),
          TabItem(
            title: const Text("Be right back"),
            selectedIcon: const Icon(Icons.watch_later_rounded, color: Colors.amber),
            onTap: () => setState(() {
              text = "Be right back";
            }),
          ),
          TabItem(
            title: const Text("Away"),
            selectedIcon: const Icon(Icons.watch_later_rounded, color: Colors.amber),
            onTap: () => setState(() {
              text = "Away";
            }),
          ),
          TabItem(
            title: const Text("Reset status"),
            selectedIcon: const Icon(CupertinoIcons.arrow_2_circlepath),
            onTap: () => setState(() {
              text = "Reset status";
            }),
          ),
        ],
      ),
      TabItem(
        selectedIcon: const Icon(CupertinoIcons.pencil_outline),
        onTap: () => setState(() {
          text = "Set status message";
        }),
        title: const Text("Set status message"),
      ),
      TabItem(
        selectedIcon: const Icon(Icons.notifications),
        title: const Text("Notifications"),
        subTitle: const Text("On"),
        onTap: () => setState(() {
          text = "Notifications";
        }),
      ),
      TabItem(
        selectedIcon: const Icon(Icons.settings),
        title: const Text("Setting"),
        onTap: () => setState(() {
          text = "Setting";
        }),
      ),
      TabItem(
        selectedIcon: const Icon(Icons.lightbulb_outline_rounded),
        title: const Text("What's new"),
        onTap: () => setState(() {
          text = "What's new";
        }),
      ),
      TabItem(
        selectedIcon: const Icon(Icons.add_rounded),
        title: const Text("Add account"),
        onTap: () => setState(() {
          text = "Add account";
        }),
      ),
    ];
    return nauticsItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nautics Side Bar Example"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Row(
        children: [
          Nautics(
            onChange: (index) => setState(() => selectedIndex = index),
            selectedIndex: selectedIndex,
            nauticsItems: nauticsItems(),
          ),
          Expanded(child: Center(child: Text("$text on index $selectedIndex"))),
        ],
      ),
    );
  }
}