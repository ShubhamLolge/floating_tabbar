import 'package:floating_tabbar/lib.dart';
import 'package:flutter/cupertino.dart';

class NauticsST extends StatefulWidget {
  const NauticsST({Key? key}) : super(key: key);

  @override
  State<NauticsST> createState() => _NauticsSTState();
}

class _NauticsSTState extends State<NauticsST> {
  bool isFloating = true;
  Color? nauticsColor;
  Color? selectedColor;
  Color? unSelectedColor;
  bool footer = false;
  bool header = false;
  bool isCollapsed = false;
  bool isConvertible = true;
  int collapsedWidth = 60;
  int expandedWidth = 250;

  int selectedIndex = 0;
  String text = "Text";
  List<TabItem> nauticsItems() {
    List<TabItem> nauticsItems = [
      TabItem(
        selectedLeading: const Icon(Icons.account_circle_rounded, size: 25),
        trailing: const Icon(Icons.person_rounded, size: 15),
        title: const Text("Jason Bourne"),
        subTitle: const Text("Associate"),
        badgeCount: 4,
        onTap: () => setState(() {
          text = "Jason Bourne";
        }),
      ),
      TabItem(
        badgeCount: 1,
        trailing: const Icon(Icons.star_rate),
        selectedLeading: const Icon(Icons.toggle_on_outlined),
        onTap: () => setState(() {
          text = "Status";
        }),
        title: const Text("Status"),
        children: [
          TabItem(
            badgeCount: 1,
            trailing: const Icon(Icons.star_rate),
            title: const Text("Appear offline"),
            selectedLeading:
                const Icon(CupertinoIcons.multiply_circle, color: Colors.grey),
            onTap: () => setState(() {
              text = "Appear offline";
            }),
          ),
          TabItem(
            title: const Text("Available"),
            selectedLeading: const Icon(Icons.done_rounded,
                color: Color.fromARGB(255, 0, 254, 8)),
            onTap: () => setState(() {
              text = "Available";
            }),
          ),
        ],
      ),
      TabItem(
        selectedLeading: const Icon(CupertinoIcons.pencil_outline),
        onTap: () => setState(() {
          text = "Set status message";
        }),
        title: const Text("Set status message"),
      ),
      TabItem(
        badgeCount: 3,
        selectedLeading: const Icon(Icons.notifications),
        title: const Text("Notifications"),
        subTitle: const Text("On"),
        onTap: () => setState(() {
          text = "Notifications";
        }),
      ),
      TabItem(
        selectedLeading: const Icon(Icons.settings),
        title: const Text("Setting"),
        onTap: () => setState(() {
          text = "Setting";
        }),
      ),
    ];
    return nauticsItems;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text("Nautics Test")),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Nautics(
            children: nauticsItems(),
            onChange: (value) => setState(() => selectedIndex = value),
            isFloating: isFloating,
            nauticsColor: nauticsColor,
            selectedColor: selectedColor,
            unSelectedColor: unSelectedColor,
            header: header == true
                ? const Text("Header",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))
                : null,
            footer: footer == true
                ? const Text("Footer",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))
                : null,
            isCollapsed: isCollapsed,
            isConvertible: isConvertible,
            collapsedWidth: collapsedWidth.toDouble(),
            expandedWidth: expandedWidth.toDouble(),
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
                      setState(() {
                        isFloating = !isFloating;
                      });
                    },
                    child: const Text("Is Floating"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      chooseColor(
                          context: context,
                          size: size,
                          selectedColor: (v) =>
                              setState(() => nauticsColor = v));
                    },
                    child: const Text("Nautics Color"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      chooseColor(
                          context: context,
                          size: size,
                          selectedColor: (v) =>
                              setState(() => selectedColor = v));
                    },
                    child: const Text("Selected Color"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      chooseColor(
                          context: context,
                          size: size,
                          selectedColor: (v) =>
                              setState(() => unSelectedColor = v));
                    },
                    child: const Text("Unselected Color"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        header = !header;
                      });
                    },
                    child: const Text("Header"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        footer = !footer;
                      });
                    },
                    child: const Text("Footer"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isCollapsed = !isCollapsed;
                      });
                    },
                    child: const Text("Is Collapsed"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isConvertible = !isConvertible;
                      });
                    },
                    child: const Text("Is Convertible"),
                  ),
                  Floater(
                    child: SizedBox(
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Collapsed Width"),
                          const SizedBox(height: 5),
                          IncrementDecrementNumber(
                            count: collapsedWidth,
                            onCountChange: (value) {
                              setState(() {
                                collapsedWidth = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Floater(
                    child: SizedBox(
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Expanded Width"),
                          const SizedBox(height: 5),
                          IncrementDecrementNumber(
                            count: expandedWidth,
                            onCountChange: (value) {
                              setState(() {
                                expandedWidth = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
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
