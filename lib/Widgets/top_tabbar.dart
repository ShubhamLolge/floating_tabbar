import 'package:floating_tabbar/Models/tab_item.dart';
import 'package:flutter/material.dart';

class TopTabbar extends StatefulWidget {
  /// List of Tab Items
  final List<TabItem> tabList;

  /// index of first page
  final int initialIndex;
  const TopTabbar({
    Key? key,
    required this.tabList,
    this.initialIndex = 0,
  }) : super(key: key);
  @override
  _TopTabbarState createState() => _TopTabbarState();
}

class _TopTabbarState extends State<TopTabbar> with SingleTickerProviderStateMixin {
  List<String> getLabelList() {
    List<String> labelList = [];
    for (var element in widget.tabList) {
      labelList.add(element.label);
    }
    return labelList;
  }

  List<Widget> getTabWidgetList() {
    List<Widget> tabWidgetList = [];
    for (var element in widget.tabList) {
      tabWidgetList.add(element.tabWidget);
    }
    return tabWidgetList;
  }

  TabController? controller;
  List<String> categories = [];
  final List<Tab> _tabs = [];

  List<Tab> getTabs(int count) {
    _tabs.clear();
    for (String e in categories) {
      _tabs.add(getTab(e));
    }
    return _tabs;
  }

  Tab getTab(String categoryname) {
    return Tab(text: categoryname);
  }

  @override
  void initState() {
    categories = getCategoryList();
    controller = TabController(length: categories.length, vsync: this, initialIndex: widget.initialIndex);
    getTabs(categories.length);

    super.initState();
  }

  List<String> getCategoryList() {
    List<String> list = getLabelList();
    return list;
  }

  AppBar customAppbarwithTabbar({TabController? controller, required BuildContext context, required List<Widget> tabs}) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      bottom: TabBar(
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
        ),
        labelColor: Theme.of(context).primaryColor,
        controller: controller,
        tabs: tabs,
        isScrollable: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: customAppbarwithTabbar(controller: controller, tabs: _tabs, context: context),
      ),
      body: TabBarView(
        controller: controller,
        children: getTabWidgetList(),
      ),
    );
  }
}
