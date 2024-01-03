import 'package:floating_tabbar/Models/tab_item.dart';
import 'package:floating_tabbar/Widgets/niftile.dart';
import 'package:flutter/material.dart';

class NiftileST extends StatefulWidget {
  const NiftileST({Key? key}) : super(key: key);

  @override
  State<NiftileST> createState() => _NiftileSTState();
}

class _NiftileSTState extends State<NiftileST> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Niftile Test")),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Niftile(
                  item: TabItem(
                    title: const Text("TiUi ST"),
                    subTitle: const Text("TiUi-Sub ST"),
                    selectedLeading: const Icon(Icons.donut_large),
                    unSelectedLeading: const Icon(Icons.done_outline_rounded),
                    trailing: const Icon(Icons.fire_extinguisher_rounded),
                    tIOnTap: true,
                    onTap: () => debugPrint("TiUi ST"),
                    badgeCount: 10,
                    isSelected: (p0) => debugPrint("isSelected: $p0"),
                    enabled: true,
                    color: Colors.teal,
                    children: [
                      TabItem(title: const Text("Sub-One"), onTap: () {}),
                      TabItem(
                        selectedLeading: const Icon(Icons.label),
                        trailing: const Icon(Icons.grain_outlined),
                        title: const Text("Sub-Two"),
                        onTap: () {},
                        children: [
                          TabItem(title: const Text("Sub-One"), onTap: () {}),
                          TabItem(title: const Text("Sub-Two"), onTap: () {}),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Niftile(
                  item: TabItem(
                    title: const Text("TiUi ST"),
                    subTitle: const Text("TiUi-Sub ST"),
                    selectedLeading: const Icon(Icons.donut_large),
                    unSelectedLeading: const Icon(Icons.done_outline_rounded),
                    trailing: const Icon(Icons.fire_extinguisher_rounded),
                    tIOnTap: true,
                    onTap: () => debugPrint("TiUi ST"),
                    isSelected: (p0) => debugPrint("isSelected: $p0"),
                    children: [
                      TabItem(title: const Text("Sub-One"), onTap: () {}),
                      TabItem(title: const Text("Sub-Two"), onTap: () {}),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Niftile(
                  isFloating: false,
                  borderRadius: BorderRadius.zero,
                  item: TabItem(
                    color: Colors.amber,
                    title: const Text("TiUi ST"),
                    subTitle: const Text("TiUi-Sub ST"),
                    selectedLeading: const Icon(Icons.donut_large),
                    unSelectedLeading: const Icon(Icons.done_outline_rounded),
                    trailing: const Icon(Icons.fire_extinguisher_rounded),
                    tIOnTap: true,
                    onTap: () => debugPrint("TiUi ST"),
                    isSelected: (p0) => debugPrint("isSelected: $p0"),
                    children: [
                      TabItem(title: const Text("Sub-One"), onTap: () {}),
                      TabItem(title: const Text("Sub-Two"), onTap: () {}),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Niftile(
                  item: TabItem(
                    title: const Text("TiUi ST"),
                    selectedLeading: const Icon(Icons.donut_large),
                    unSelectedLeading: const Icon(Icons.done_outline_rounded),
                    trailing: const Icon(Icons.fire_extinguisher_rounded),
                    tIOnTap: true,
                    onTap: () => debugPrint("TiUi ST"),
                    badgeCount: 9,
                    isSelected: (p0) => debugPrint("isSelected: $p0"),
                  ),
                ),
                const SizedBox(height: 10),
                Niftile(
                  item: TabItem(
                    title: const Text("TiUi ST"),
                    selectedLeading: const Icon(Icons.donut_large),
                    unSelectedLeading: const Icon(Icons.done_outline_rounded),
                    trailing: const Icon(Icons.fire_extinguisher_rounded),
                    tIOnTap: true,
                    onTap: () => debugPrint("TiUi ST"),
                    badgeCount: 9,
                    isSelected: (p0) => debugPrint("isSelected: $p0"),
                    color: Colors.cyan,
                  ),
                ),
                const SizedBox(height: 10),
                Niftile(
                  selectedColor: Colors.red,
                  unSelectedColor: Colors.green,
                  item: TabItem(
                    title: const Text("TiUi ST"),
                    selectedLeading: const Icon(Icons.donut_large),
                    unSelectedLeading: const Icon(Icons.done_outline_rounded),
                    trailing: const Icon(Icons.fire_extinguisher_rounded),
                    tIOnTap: true,
                    onTap: () => debugPrint("TiUi ST"),
                    badgeCount: 9,
                    isSelected: (p0) => debugPrint("isSelected: $p0"),
                    color: Colors.lightGreenAccent,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Niftile(
                      isFloating: false,
                      buttonMode: true,
                      width: 100,
                      borderRadius: BorderRadius.circular(60),
                      item: TabItem(
                        color: Colors.orange,
                        selectedLeading: const Icon(Icons.gamepad_rounded),
                        trailing: const Icon(Icons.park_rounded),
                        title: const Text("TIUI", textAlign: TextAlign.center),
                        onTap: () {},
                      ),
                    ),
                    Niftile(
                      buttonMode: true,
                      showLeading: true,
                      showTrailing: true,
                      borderRadius: BorderRadius.circular(60),
                      item: TabItem(
                        badgeCount: 2,
                        trailing: const Icon(Icons.park_rounded),
                        selectedLeading: const Icon(Icons.face),
                        title: const Text("TIUI"),
                        subTitle: const Text("TIUI-Sub"),
                        onTap: () {},
                        color: Colors.tealAccent,
                        children: [
                          TabItem(title: const Text("Sub-One"), onTap: () {}),
                          TabItem(
                            selectedLeading: const Icon(Icons.label),
                            trailing: const Icon(Icons.grain_outlined),
                            title: const Text("Sub-Two"),
                            onTap: () {},
                            children: [
                              TabItem(title: const Text("Sub-One"), onTap: () {}),
                              TabItem(title: const Text("Sub-Two"), onTap: () {}),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Niftile(
                      buttonMode: true,
                      width: 100,
                      borderRadius: BorderRadius.circular(60),
                      item: TabItem(
                        badgeCount: 2,
                        trailing: const Icon(Icons.park_rounded),
                        selectedLeading: const Icon(Icons.backup_table_rounded),
                        title: const Text("TIUI"),
                        onTap: () {},
                      ),
                    ),
                    Niftile(
                      buttonMode: true,
                      width: 100,
                      borderRadius: BorderRadius.circular(60),
                      item: TabItem(
                        badgeCount: 2,
                        trailing: const Icon(Icons.park_rounded),
                        selectedLeading: const Icon(Icons.backup_table_rounded),
                        title: const Text("TIUI"),
                        onTap: () {},
                        children: [
                          TabItem(title: const Text("One"), onTap: () {}),
                          TabItem(title: const Text("Two"), onTap: () {}),
                        ],
                      ),
                    ),
                    Niftile(
                      buttonMode: true,
                      width: 100,
                      borderRadius: BorderRadius.circular(60),
                      item: TabItem(
                        trailing: const Icon(Icons.park_rounded),
                        title: const Text("TIUI", textAlign: TextAlign.center),
                        onTap: () {},
                        children: [
                          TabItem(title: const Text("One"), onTap: () {}),
                          TabItem(title: const Text("Two"), onTap: () {}),
                        ],
                      ),
                    ),
                    Niftile(
                      buttonMode: true,
                      width: 100,
                      borderRadius: BorderRadius.circular(60),
                      item: TabItem(
                        title: const Text("TIUI", textAlign: TextAlign.center),
                        onTap: () {},
                        children: [
                          TabItem(title: const Text("One"), onTap: () {}),
                          TabItem(title: const Text("Two"), onTap: () {}),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 300,
                      child: Niftile(
                        isFloating: false,
                        showTrailing: false,
                        item: TabItem(
                          title: const Text("TiUi ST"),
                          selectedLeading: const Icon(Icons.donut_large),
                          unSelectedLeading: const Icon(Icons.done_outline_rounded),
                          trailing: const Icon(Icons.fire_extinguisher_rounded),
                          tIOnTap: true,
                          onTap: () => debugPrint("TiUi ST"),
                          badgeCount: 9,
                          isSelected: (p0) => debugPrint("isSelected: $p0"),
                          color: Colors.amber,
                          children: [
                            TabItem(title: const Text("One"), onTap: () {}),
                            TabItem(title: const Text("Two"), onTap: () {}),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Niftile(
                      width: 260,
                      showLeading: false,
                      item: TabItem(
                        title: const Text("TiUi ST"),
                        selectedLeading: const Icon(Icons.donut_large),
                        unSelectedLeading: const Icon(Icons.done_outline_rounded),
                        trailing: const Icon(Icons.fire_extinguisher_rounded),
                        tIOnTap: true,
                        onTap: () => debugPrint("TiUi ST"),
                        badgeCount: 9,
                        isSelected: (p0) => debugPrint("isSelected: $p0"),
                        color: Colors.indigo.shade100,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Niftile(
                      width: 260,
                      item: TabItem(
                        title: const Text("TiUi ST"),
                        selectedLeading: const Icon(Icons.donut_large),
                        unSelectedLeading: const Icon(Icons.done_outline_rounded),
                        trailing: const Icon(Icons.fire_extinguisher_rounded),
                        tIOnTap: true,
                        onTap: () => debugPrint("TiUi ST"),
                        badgeCount: 9,
                        isSelected: (p0) => debugPrint("isSelected: $p0"),
                        color: Colors.pink.shade100,
                        children: [
                          TabItem(title: const Text("One"), onTap: () {}),
                          TabItem(title: const Text("Two"), onTap: () {}),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
