import 'package:floating_tabbar/lib.dart';

class FloaterST extends StatefulWidget {
  const FloaterST({Key? key}) : super(key: key);

  @override
  State<FloaterST> createState() => _FloaterSTState();
}

class _FloaterSTState extends State<FloaterST> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Floater Test")),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Floater(
              elevation: 0,
              child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.flight_rounded),
                label: const Text("Test"),
              ),
            ),
            const SizedBox(width: 10),
            Floater(
              child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.flight_rounded),
                label: const Text("Floater Test"),
              ),
            ),
            const SizedBox(width: 10),
            Floater(
              backgroundColor: Colors.lightBlueAccent,
              child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.flight_rounded),
                label: const Text("Floater Test"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
