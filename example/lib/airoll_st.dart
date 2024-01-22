import 'package:floating_tabbar/lib.dart';
import 'package:flutter/cupertino.dart';

class AirollST extends StatefulWidget {
  const AirollST({Key? key}) : super(key: key);

  @override
  State<AirollST> createState() => _AirollSTState();
}

class _AirollSTState extends State<AirollST> {
  List<TabItem> nonClassifiedTabs = [
    TabItem(
        title: const Text("Wind"),
        onTap: () {},
        selectedLeading: const Icon(Icons.air_rounded)),
    TabItem(title: const Text("Water"), onTap: () {}, color: Colors.amber),
    TabItem(
        title: const Text("Land"),
        onTap: () {},
        enabled: false,
        color: Colors.green),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key("Airoll-Test"),
      appBar: AppBar(title: const Text("Airoll Test")),
      body: Center(
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            testAirollUI(
              airoll: Airoll(
                color: Colors.pink.shade50,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                key: const Key("Airoll-Example-One"),
                children: [
                  TabItem(
                    color: Colors.amber,
                    title: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 8),
                            child: InkWell(
                              onTap: () => debugPrint("Like"),
                              child: Column(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.redAccent),
                                    child: const Center(
                                        child: Icon(CupertinoIcons.heart_fill)),
                                  ),
                                  const Text("Like",
                                      style: TextStyle(
                                          fontSize: 8,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 8),
                            child: InkWell(
                              onTap: () => debugPrint("Share"),
                              child: Column(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.blue),
                                    child:
                                        const Center(child: Icon(Icons.share)),
                                  ),
                                  const Text("Share",
                                      style: TextStyle(
                                          fontSize: 8,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => debugPrint("Comment"),
                            child: Column(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.amber),
                                  child: const Center(
                                      child: Icon(Icons.mode_comment_rounded)),
                                ),
                                const Text("Comment",
                                    style: TextStyle(
                                        fontSize: 8,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {},
                  ),
                ],
                child: const Icon(Icons.now_widgets_rounded),
              ),
              description: "One TabItem",
            ),
            testAirollUI(
              airoll: Airoll(
                key: const Key("Airoll-Example-One"),
                children: nonClassifiedTabs,
                child: const Icon(Icons.sailing_rounded),
              ),
              description: "Icon child & non-classified Tabs",
            ),
            testAirollUI(
              airoll: Airoll(
                key: const Key("Airoll-Example-Two"),
                children: nonClassifiedTabs,
                child: const Text("Menu"),
              ),
              description: "Text child & non-classified Tabs",
            ),
            testAirollUI(
              airoll: Airoll(
                key: const Key("Airoll-Example-Three"),
                isFloating: false,
                children: classifiedTabs(),
                child: const Icon(Icons.table_rows_rounded),
              ),
              description: "Text child & non-classified Tabs",
            ),
            testAirollUI(
              airoll: Airoll(
                key: const Key("Airoll-Example-Four"),
                children: classifiedTabs(),
                showLeading: true,
                child: const Icon(Icons.table_rows_rounded),
              ),
              description: "Leading Tabs",
            ),
            testAirollUI(
              airoll: Airoll(
                key: const Key("Airoll-Example-Five"),
                children: classifiedTTabs(),
                showLeading: true,
                showTrailing: true,
                child: const Icon(Icons.table_rows_rounded),
              ),
              description: "Leading + SubTabs + Trailing Tab",
            ),
            testAirollUI(
              airoll: Airoll(
                key: const Key("Airoll-Example-Six"),
                children: classifiedNTabs(),
                showLeading: true,
                showTrailing: true,
                child: const Icon(Icons.table_rows_rounded),
              ),
              description:
                  "Leading + SubTabs + Trailing + Notification count Tab",
            ),
          ],
        ),
      ),
    );
  }
}

Widget testAirollUI({
  required Airoll airoll,
  required String description,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        airoll,
        const SizedBox(height: 10),
        Text(description),
      ],
    ),
  );
}

List<TabItem> classifiedNTabs() {
  List<TabItem> subTabs = [
    TabItem(
      title: const Text("Forest"),
      onTap: () {},
      badgeCount: 1,
      unSelectedLeading: const Icon(Icons.forest_outlined),
      trailing: const Icon(Icons.workspace_premium_rounded, color: Colors.blue),
    ),
    TabItem(
        title: const Text("Desert"),
        onTap: () {},
        unSelectedLeading: const Icon(Icons.landscape_outlined),
        badgeCount: 3),
  ];
  List<TabItem> tabs = [
    TabItem(
      title: const Text("Wind"),
      onTap: () {},
      selectedLeading: const Icon(Icons.air),
      trailing: const Icon(Icons.workspace_premium_rounded, color: Colors.blue),
    ),
    TabItem(
      title: const Text("Water"),
      onTap: () {},
      selectedLeading: const Icon(Icons.water),
      trailing: const Icon(Icons.error, color: Colors.orange),
      children: subTabs,
    ),
    TabItem(
      selectedLeading: const Icon(Icons.landscape),
      badgeCount: 5000000,
      trailing: const Icon(Icons.error, color: Colors.orange),
      children: subTabs,
      title: const Text("Land"),
      onTap: () {},
    ),
  ];
  return tabs;
}

List<TabItem> classifiedTabs() {
  List<TabItem> subTabs = [
    TabItem(
        title: const Text("Forest"),
        onTap: () {},
        unSelectedLeading: const Icon(Icons.forest_outlined)),
    TabItem(
        title: const Text("Desert"),
        onTap: () {},
        unSelectedLeading: const Icon(Icons.landscape_outlined)),
  ];
  List<TabItem> tabs = [
    TabItem(
        title: const Text("Wind"),
        onTap: () {},
        selectedLeading: const Icon(Icons.air)),
    TabItem(
        title: const Text("Water"),
        onTap: () {},
        selectedLeading: const Icon(Icons.water)),
    TabItem(
      selectedLeading: const Icon(Icons.landscape),
      title: const Text("Land"),
      onTap: () {},
      children: subTabs,
    ),
  ];
  return tabs;
}

List<TabItem> classifiedTTabs() {
  List<TabItem> subTabs = [
    TabItem(
      title: const Text("Forest"),
      onTap: () {},
      unSelectedLeading: const Icon(Icons.forest_outlined),
      trailing: const Icon(Icons.workspace_premium_rounded, color: Colors.blue),
    ),
    TabItem(
        title: const Text("Desert"),
        onTap: () {},
        unSelectedLeading: const Icon(Icons.landscape_outlined)),
  ];
  List<TabItem> tabs = [
    TabItem(
      title: const Text("Wind"),
      onTap: () {},
      selectedLeading: const Icon(Icons.air),
      trailing: const Icon(Icons.workspace_premium_rounded, color: Colors.blue),
    ),
    TabItem(
      title: const Text("Water"),
      onTap: () {},
      selectedLeading: const Icon(Icons.water),
      trailing: const Icon(Icons.workspace_premium_rounded, color: Colors.blue),
    ),
    TabItem(
      selectedLeading: const Icon(Icons.landscape),
      trailing: const Icon(Icons.error, color: Colors.orange),
      title: const Text("Land"),
      onTap: () {},
      children: subTabs,
    ),
  ];
  return tabs;
}
