import 'package:floating_tabbar/Widgets/ops_shell.dart';
import 'package:flutter/material.dart';

import 'vitrify_st.dart';

class OpsShellST extends StatefulWidget {
  const OpsShellST({Key? key}) : super(key: key);

  @override
  State<OpsShellST> createState() => _OpsShellSTState();
}

class _OpsShellSTState extends State<OpsShellST> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: const Text("OpsShell Test")),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: size.height,
            width: size.width * 0.3,
            child: scaffold(type: "Normal UI"),
          ),
          OpsShell(
            height: size.height,
            width: size.width * 0.3,
            child: scaffold(type: "OpsShell UI"),
          ),
          SizedBox(
            height: size.height,
            width: size.width * 0.3,
            child: OpsShell(
              alignment: Alignment.bottomRight,
              backgroundDecoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
              ),
              height: size.height * 0.6,
              width: size.width * 0.2,
              child: scaffold(type: "OpsShell UI"),
            ),
          ),
        ],
      ),
    );
  }

  Widget scaffold({required String type}) {
    return Scaffold(
      appBar: AppBar(title: Text(type)),
      floatingActionButton: FloatingActionButton(onPressed: () {}, child: const Icon(Icons.icecream_rounded)),
      body: SizedBox(
        child: ListView(
          children: List.generate(
            10,
            (index) => Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              height: 200,
              width: 100,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.7),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
