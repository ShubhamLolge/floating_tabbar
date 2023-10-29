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
      theme: ThemeData(
        primaryColor: Colors.blue,
        canvasColor: Colors.grey[50],
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
  List<TabItem> topTabbarTabItemlist() {
    List<TabItem> topTabbarTabItemlist = [
      TabItem(
        onTap: () {},
        title: const Text("Nautics SideBar"),
        tab: const Center(
            child: Text("Nautics SideBar", style: TextStyle(fontSize: 30))),
      ),
      TabItem(
        onTap: () {},
        title: const Text("Public Events"),
        tab: const Center(
            child: Text("Public Events", style: TextStyle(fontSize: 30))),
      ),
    ];
    return topTabbarTabItemlist;
  }

  Widget floatingTabBarPageView() {
    List<TabItem> tabList() {
      List<TabItem> _list = [
        TabItem(
          onTap: () {},
          selectedLeadingIcon: const Icon(Icons.dashboard),
          title: const Text("Dashboard"),
          tab: TopTabBar(children: topTabbarTabItemlist()),
          badgeCount: 10,
        ),
        TabItem(
          onTap: () {},
          selectedLeadingIcon: const Icon(Icons.library_books),
          title: const Text("Report"),
          tab: const Center(
              child: Text("Report", style: TextStyle(fontSize: 30))),
        ),
        TabItem(
          onTap: () {},
          selectedLeadingIcon: const Icon(Icons.settings),
          title: const Text("Settings"),
          tab: const Center(
              child: Text("Settings", style: TextStyle(fontSize: 30))),
        ),
        TabItem(
          title: const Text("Work"),
          onTap: () {},
          selectedLeadingIcon: const Icon(Icons.maps_home_work_sharp),
          tab:
              const Center(child: Text("Work", style: TextStyle(fontSize: 30))),
        ),
        TabItem(
          title: const Text("ShowCase"),
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ShowCase()));
          },
          selectedLeadingIcon: const Icon(Icons.flight_rounded),
          tab: const Center(
              child: Text("ShowCase", style: TextStyle(fontSize: 30))),
        ),
      ];
      return _list;
    }

    return FloatingTabBar(
      children: tabList(),
      useNautics: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return floatingTabBarPageView();
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
        selectedLeadingIcon: const Icon(Icons.account_circle_rounded, size: 25),
        trailingIcon: const Icon(Icons.arrow_forward_ios_rounded, size: 15),
        title: const Text("Jason Bourne"),
        subTitle: const Text("Associate"),
        onTap: () => setState(() {
          text = "Jason Bourne";
        }),
      ),
      TabItem(
        selectedLeadingIcon: const Icon(Icons.toggle_on_outlined),
        onTap: () => setState(() {
          text = "Status";
        }),
        title: const Text("Status"),
        children: [
          TabItem(
            title: const Text("Appear offline"),
            selectedLeadingIcon:
                const Icon(CupertinoIcons.multiply_circle, color: Colors.grey),
            onTap: () => setState(() {
              text = "Appear offline";
            }),
          ),
          TabItem(
            title: const Text("Available"),
            selectedLeadingIcon: const Icon(Icons.done_rounded,
                color: Color.fromARGB(255, 0, 254, 8)),
            onTap: () => setState(() {
              text = "Available";
            }),
          ),
          TabItem(
            title: const Text("Busy"),
            selectedLeadingIcon: const Icon(Icons.circle, color: Colors.red),
            onTap: () => setState(() {
              text = "Busy";
            }),
          ),
          TabItem(
            title: const Text("Do not disturb"),
            selectedLeadingIcon:
                const Icon(Icons.remove_circle, color: Colors.red),
            onTap: () => setState(() {
              text = "Do not disturb";
            }),
          ),
          TabItem(
            title: const Text("Be right back"),
            selectedLeadingIcon:
                const Icon(Icons.watch_later_rounded, color: Colors.amber),
            onTap: () => setState(() {
              text = "Be right back";
            }),
          ),
          TabItem(
            title: const Text("Away"),
            selectedLeadingIcon:
                const Icon(Icons.watch_later_rounded, color: Colors.amber),
            onTap: () => setState(() {
              text = "Away";
            }),
          ),
          TabItem(
            title: const Text("Reset status"),
            selectedLeadingIcon: const Icon(CupertinoIcons.arrow_2_circlepath),
            onTap: () => setState(() {
              text = "Reset status";
            }),
          ),
        ],
      ),
      TabItem(
        selectedLeadingIcon: const Icon(CupertinoIcons.pencil_outline),
        onTap: () => setState(() {
          text = "Set status message";
        }),
        title: const Text("Set status message"),
      ),
      TabItem(
        selectedLeadingIcon: const Icon(Icons.notifications),
        title: const Text("Notifications"),
        subTitle: const Text("On"),
        onTap: () => setState(() {
          text = "Notifications";
        }),
      ),
      TabItem(
        selectedLeadingIcon: const Icon(Icons.settings),
        title: const Text("Setting"),
        onTap: () => setState(() {
          text = "Setting";
        }),
      ),
      TabItem(
        selectedLeadingIcon: const Icon(Icons.lightbulb_outline_rounded),
        title: const Text("What's new"),
        onTap: () => setState(() {
          text = "What's new";
        }),
      ),
      TabItem(
        selectedLeadingIcon: const Icon(Icons.add_rounded),
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
            initialIndex: selectedIndex,
            children: nauticsItems(),
          ),
          Expanded(child: Center(child: Text("$text on index $selectedIndex"))),
        ],
      ),
    );
  }
}
