import 'package:floating_tabbar/lib.dart';

class FloatingTabbarST extends StatefulWidget {
  /// Force the widget to be in small screen mode
  final bool? smallScreenMode;

  const FloatingTabbarST({Key? key, this.smallScreenMode}) : super(key: key);

  @override
  State<FloatingTabbarST> createState() => _FloatingTabbarSTState();
}

class _FloatingTabbarSTState extends State<FloatingTabbarST> {
  bool leading = false;
  bool nauticsFooter = false;
  bool parentAppbar = false;
  bool isFloating = true;
  bool useNautics = false;
  bool showTabLabelsForFloating = false;
  bool showTabLabelsForNonFloating = false;
  bool useIndicator = false;

  Color backgroundColor = Colors.white;
  Color activeColor = Colors.purple;
  Color inactiveColor = Colors.black;
  Color indicatorColor = Colors.purple.withOpacity(0.5);

  int minExtendedWidth = 200;

  late final Widget floatingTabbarST;

  @override
  void initState() {
    super.initState();
    floatingTabbarST =
        const OpsShell(child: FloatingTabbarST(smallScreenMode: true));
  }

  List<TabItem> tabListOne() {
    List<TabItem> list = [
      TabItem(
        title: const Text("Work"),
        onTap: () {},
        selectedLeading: const Icon(Icons.home),
        badgeCount: 1,
        unSelectedLeading: const Icon(Icons.home_outlined),
        tab: const Center(child: Text("Work", style: TextStyle(fontSize: 30))),
      ),
      TabItem(
        onTap: () {},
        selectedLeading: const Icon(Icons.library_books),
        unSelectedLeading: const Icon(Icons.library_books_outlined),
        title: const Text("Report"),
        tab:
            const Center(child: Text("Report", style: TextStyle(fontSize: 30))),
      ),
      TabItem(
        onTap: () {},
        selectedLeading: const Icon(Icons.settings),
        unSelectedLeading: const Icon(Icons.settings_outlined),
        title: const Text("Settings"),
        tab: const Center(
            child: Text("Settings", style: TextStyle(fontSize: 30))),
      ),
    ];
    return list;
  }

  Widget showCMenu({required Size size}) {
    return SizedBox(
      height: size.height * 0.6,
      width: size.width * 0.3,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children3(context, size)),
    );
  }

  List<TabItem> tabListTwo({required Size size}) {
    List<TabItem> list = [
      TabItem(
        title: const Text("Work"),
        onTap: () {},
        selectedLeading: const Icon(Icons.home),
        badgeCount: 1,
        unSelectedLeading: const Icon(Icons.home_outlined),
        tab: widget.smallScreenMode == true
            ? showCMenu(size: size)
            : const Center(child: Text("Work", style: TextStyle(fontSize: 30))),
      ),
      TabItem(
        onTap: () {},
        selectedLeading: const Icon(Icons.library_books),
        unSelectedLeading: const Icon(Icons.library_books_outlined),
        title: const Text("Report"),
        tab:
            const Center(child: Text("Report", style: TextStyle(fontSize: 30))),
      ),
      TabItem(
        onTap: () {},
        selectedLeading: const Icon(Icons.settings),
        unSelectedLeading: const Icon(Icons.settings_outlined),
        title: const Text("Settings"),
        tab: widget.smallScreenMode == true
            ? const Center(
                child: Text("Settings", style: TextStyle(fontSize: 30)))
            : floatingTabbarST,
      ),
    ];
    return list;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: widget.smallScreenMode == true
          ? null
          : AppBar(title: const Text("FloatingTabBar Test")),
      body: Row(
        children: [
          Expanded(
            child: FloatingTabBar(
              backgroundColor: backgroundColor,
              activeColor: activeColor,
              inactiveColor: inactiveColor,
              indicatorColor: indicatorColor,
              leading: leading ? const Icon(Icons.home_work_rounded) : null,
              nauticsFooter:
                  nauticsFooter ? const Icon(Icons.more_horiz) : null,
              parentAppbar:
                  parentAppbar ? AppBar(title: const Text("pAppBar")) : null,
              minExtendedWidth: minExtendedWidth.toDouble(),
              isFloating: isFloating,
              useNautics: useNautics,
              showTabLabelsForFloating: showTabLabelsForFloating,
              showTabLabelsForNonFloating: showTabLabelsForNonFloating,
              useIndicator: useIndicator,
              smallScreenMode: widget.smallScreenMode,
              children: tabListTwo(size: size),
            ),
          ),
          widget.smallScreenMode == true
              ? Container()
              : Floater(
                  child: SizedBox(
                    width: size.width * 0.2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: children2(context, size),
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  List<Widget> children2(BuildContext context, Size size) {
    return [
      const SizedBox(height: 10),
      ElevatedButton(
        onPressed: () {
          chooseColor(
              context: context,
              size: size,
              selectedColor: (v) => setState(() => backgroundColor = v));
        },
        child: const Text("Background Color"),
      ),
      ElevatedButton(
        onPressed: () {
          chooseColor(
              context: context,
              size: size,
              selectedColor: (v) => setState(() => activeColor = v));
        },
        child: const Text("Active Color"),
      ),
      ElevatedButton(
        onPressed: () {
          chooseColor(
              context: context,
              size: size,
              selectedColor: (v) => setState(() => inactiveColor = v));
        },
        child: const Text("Inactive Color"),
      ),
      ElevatedButton(
        onPressed: () {
          setState(() {
            useIndicator = !useIndicator;
          });
        },
        child: const Text("Use Indicator"),
      ),
      ElevatedButton(
        onPressed: () {
          chooseColor(
              context: context,
              size: size,
              selectedColor: (v) => setState(() => indicatorColor = v));
        },
        child: const Text("Indicator Color"),
      ),
      ElevatedButton(
        onPressed: () {
          setState(() {
            leading = !leading;
          });
        },
        child: const Text("Leading"),
      ),
      ElevatedButton(
        onPressed: () {
          setState(() {
            nauticsFooter = !nauticsFooter;
          });
        },
        child: const Text("Nautics Footer"),
      ),
      ElevatedButton(
        onPressed: () {
          setState(() {
            parentAppbar = !parentAppbar;
          });
        },
        child: const Text("Parent Appbar"),
      ),
      Floater(
        child: SizedBox(
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Min Extended Width"),
              const SizedBox(height: 5),
              IncrementDecrementNumber(
                count: minExtendedWidth,
                onCountChange: (value) {
                  setState(() {
                    minExtendedWidth = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      ElevatedButton(
        onPressed: () {
          setState(() {
            isFloating = !isFloating;
          });
        },
        child: const Text("Is Floating"),
      ),
      ElevatedButton(
        onPressed: () {
          setState(() {
            useNautics = !useNautics;
          });
        },
        child: const Text("Use Nautics"),
      ),
      const SizedBox(height: 10),
    ];
  }

  List<Widget> children3(BuildContext context, Size size) {
    return [
      const SizedBox(height: 10),
      ElevatedButton(
        onPressed: () {
          chooseColor(
              context: context,
              size: size,
              selectedColor: (v) => setState(() => backgroundColor = v));
        },
        child: const Text("Background Color"),
      ),
      ElevatedButton(
        onPressed: () {
          chooseColor(
              context: context,
              size: size,
              selectedColor: (v) => setState(() => activeColor = v));
        },
        child: const Text("Active Color"),
      ),
      ElevatedButton(
        onPressed: () {
          chooseColor(
              context: context,
              size: size,
              selectedColor: (v) => setState(() => inactiveColor = v));
        },
        child: const Text("Inactive Color"),
      ),
      ElevatedButton(
        onPressed: () {
          setState(() {
            parentAppbar = !parentAppbar;
          });
        },
        child: const Text("Parent Appbar"),
      ),
      ElevatedButton(
        onPressed: () {
          setState(() {
            isFloating = !isFloating;
          });
        },
        child: const Text("Is Floating"),
      ),
      ElevatedButton(
        onPressed: () {
          setState(() {
            showTabLabelsForFloating = !showTabLabelsForFloating;
          });
        },
        child: const Text("Show Tab Labels For Floating"),
      ),
      ElevatedButton(
        onPressed: () {
          setState(() {
            showTabLabelsForNonFloating = !showTabLabelsForNonFloating;
          });
        },
        child: const Text("Show Tab Labels For Non Floating"),
      ),
      const SizedBox(height: 10),
    ];
  }
}
