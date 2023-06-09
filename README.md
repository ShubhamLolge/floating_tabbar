# Floating TabBar

The floating_tabbar package for Flutter allows you to use the responsive design for all platforms made from the Material Design System.

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


## Usage
```dart
  List<TabItem> topTabbarTabItemlist() {
    List<TabItem> topTabbarTabItemlist = [
      TabItem(
        onTap: () {},
        title: const Text("Nautics SideBar"),
        tab: const Center(child: Text("Nautics SideBar", style: TextStyle(fontSize: 30))),
      ),
      TabItem(
        onTap: () {},
        title: const Text("Public Events"),
        tab: const Center(child: Text("Public Events", style: TextStyle(fontSize: 30))),
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
          tab: TopTabbar(tabList: topTabbarTabItemlist()),
          showBadge: true,
          badgeCount: 10,
        ),
        TabItem(
          onTap: () {},
          selectedLeadingIcon: const Icon(Icons.library_books),
          title: const Text("Report"),
          tab: const Center(child: Text("Report", style: TextStyle(fontSize: 30))),
        ),
        TabItem(
          onTap: () {},
          selectedLeadingIcon: const Icon(Icons.settings),
          title: const Text("Settings"),
          tab: const Center(child: Text("Settings", style: TextStyle(fontSize: 30))),
        ),
        TabItem(
          title: const Text("Work"),
          onTap: () {},
          selectedLeadingIcon: const Icon(Icons.maps_home_work_sharp),
          tab: const Center(child: Text("Work", style: TextStyle(fontSize: 30))),
        ),
        TabItem(
          title: const Text("ShowCase"),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ShowCase()));
          },
          selectedLeadingIcon: const Icon(Icons.flight_rounded),
          tab: const Center(child: Text("ShowCase", style: TextStyle(fontSize: 30))),
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
```
<table>
  <tr>
    <td valign="top"><img src="https://user-images.githubusercontent.com/75387392/184212839-57872c36-eeb9-40aa-ac3f-3b41b718c7a4.png"/></td>
    <td valign="top"><img src="https://user-images.githubusercontent.com/75387392/184212823-3f10015d-727a-4e6a-9adc-feeb4b3e76e3.png"/></td>
    <td valign="top"><img src="https://user-images.githubusercontent.com/75387392/184212829-be03551d-ea02-410b-80b7-1d681a161975.png"/></td>
  </tr>
</table>

<table>
  <tr>
    <td valign="top"><img src="https://user-images.githubusercontent.com/75387392/194056692-e708774b-e383-4dee-adf3-1f85109edec2.png"/></td>
    <td valign="top"><img src="https://user-images.githubusercontent.com/75387392/194056696-9051ce2e-346b-46bf-bfca-31f413113cd1.png"/></td>
  </tr>
</table>
<table>
  <tr>
    <td valign="top"><img src="https://user-images.githubusercontent.com/75387392/194056700-22d7fcb8-7888-40b3-9a9e-f50cdf6de552.png"/></td>
    <td valign="top"><img src="https://user-images.githubusercontent.com/75387392/194056705-30b303d5-aff1-4884-a38e-6bb4a68a24b1.png"/></td>
  </tr>
</table>

## Nautics

Nautics is the SideBar navigation widget that allows you to create sidebar with items of your choice which you provide
using help of TabItem model class, use Nautics as drawer in its collapsed and expanded form, make settings UI using it,
or navigation for your app, just list of TabItems and you are done.

```dart

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
            selectedLeadingIcon: const Icon(CupertinoIcons.multiply_circle, color: Colors.grey),
            onTap: () => setState(() {
              text = "Appear offline";
            }),
          ),
          TabItem(
            title: const Text("Available"),
            selectedLeadingIcon: const Icon(Icons.done_rounded, color: Color.fromARGB(255, 0, 254, 8)),
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
            selectedLeadingIcon: const Icon(Icons.remove_circle, color: Colors.red),
            onTap: () => setState(() {
              text = "Do not disturb";
            }),
          ),
          TabItem(
            title: const Text("Be right back"),
            selectedLeadingIcon: const Icon(Icons.watch_later_rounded, color: Colors.amber),
            onTap: () => setState(() {
              text = "Be right back";
            }),
          ),
          TabItem(
            title: const Text("Away"),
            selectedLeadingIcon: const Icon(Icons.watch_later_rounded, color: Colors.amber),
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

```
<table>
  <tr>
    <td valign="top"><img src="https://user-images.githubusercontent.com/75387392/194055861-14cc21d0-cf9e-44c3-8c37-52d60a864184.jpeg"/></td>
  </tr>
    <td valign="top"><img src="https://user-images.githubusercontent.com/75387392/194055865-581d71ce-c9cc-4124-b481-8e204f5e0493.jpeg"/></td>
    <td valign="top"><img src="https://user-images.githubusercontent.com/75387392/194055868-3f6ed7d9-c1ce-4f57-b553-97655ea19eb3.jpeg"/></td>
</table>

and much more.