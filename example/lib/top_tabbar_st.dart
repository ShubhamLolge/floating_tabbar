import 'package:floating_tabbar/lib.dart';

class TopTabBarST extends StatefulWidget {
  const TopTabBarST({Key? key}) : super(key: key);

  @override
  State<TopTabBarST> createState() => _TopTabBarSTState();
}

class _TopTabBarSTState extends State<TopTabBarST> {
  bool primaryTabBar = false;
  bool isScrollable = false;
  bool customIndicator = false;
  Color indicatorColor = Colors.purple.withOpacity(0.3);
  Color labelColor = Colors.purple;
  Color overlayColor = Colors.white;
  Color unselectedLabelColor = Colors.black;
  Color dividerColor = Colors.transparent;

  List<TabItem> children() {
    List<TabItem> list1 = [
      TabItem(
        title: const Text("One"),
        onTap: () {},
        tab: const Center(child: Text("One", style: TextStyle(fontSize: 30))),
      ),
      TabItem(
        title: const Text("Two"),
        onTap: () {},
        tab: const Center(child: Text("Two", style: TextStyle(fontSize: 30))),
      ),
    ];
    List<TabItem> list = [
      TabItem(
        title: const Text("One", style: TextStyle(fontWeight: FontWeight.bold)),
        onTap: () {},
        tab: const Center(child: Text("One", style: TextStyle(fontSize: 30))),
      ),
      TabItem(
        title: const Text("Two", style: TextStyle(fontWeight: FontWeight.bold)),
        onTap: () {},
        tab: const Center(child: Text("Two", style: TextStyle(fontSize: 30))),
      ),
      TabItem(
        title:
            const Text("Three", style: TextStyle(fontWeight: FontWeight.bold)),
        onTap: () {},
        tab: const Center(child: Text("Three", style: TextStyle(fontSize: 30))),
        children: list1,
      ),
    ];
    return list;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: const Text("TopTabBar Test")),
      body: Row(
        children: [
          Expanded(
            child: TopTabBar(
              onTap: (p0) {},
              indicator: customIndicator == true
                  ? BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Theme.of(context).primaryColor.withOpacity(0.3))
                  : null,
              primaryTabBar: primaryTabBar,
              indicatorColor: indicatorColor,
              labelColor: labelColor,
              overlayColor: MaterialStatePropertyAll(overlayColor),
              unselectedLabelColor: unselectedLabelColor,
              dividerColor: dividerColor,
              isScrollable: isScrollable,
              children: children(),
            ),
          ),
          Floater(
            child: SizedBox(
              width: size.width * 0.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      chooseColor(
                          context: context,
                          size: size,
                          selectedColor: (v) =>
                              setState(() => indicatorColor = v));
                    },
                    child: const Text("Indicator Color"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      chooseColor(
                          context: context,
                          size: size,
                          selectedColor: (v) => setState(() => labelColor = v));
                    },
                    child: const Text("Label Color"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      chooseColor(
                          context: context,
                          size: size,
                          selectedColor: (v) =>
                              setState(() => unselectedLabelColor = v));
                    },
                    child: const Text("Unselected Label Color"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      chooseColor(
                          context: context,
                          size: size,
                          selectedColor: (v) =>
                              setState(() => overlayColor = v));
                    },
                    child: const Text("Overlay Color"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      chooseColor(
                          context: context,
                          size: size,
                          selectedColor: (v) =>
                              setState(() => dividerColor = v));
                    },
                    child: const Text("Divider Color"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        primaryTabBar = !primaryTabBar;
                      });
                    },
                    child: const Text("Is Primary TabBar"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isScrollable = !isScrollable;
                      });
                    },
                    child: const Text("Is TabBar Scrollable"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        customIndicator = !customIndicator;
                      });
                    },
                    child: const Text("Custom Indicator"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        customIndicator = !customIndicator;
                      });
                    },
                    child: const Icon(Icons.refresh),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
