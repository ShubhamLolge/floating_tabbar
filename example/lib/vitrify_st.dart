import 'package:floating_tabbar/lib.dart';

class VitrifyST extends StatefulWidget {
  const VitrifyST({Key? key}) : super(key: key);

  @override
  State<VitrifyST> createState() => _VitrifySTState();
}

String url =
    "https://cdn.pixabay.com/photo/2023/12/08/09/13/vine-8437282_1280.jpg";

class _VitrifySTState extends State<VitrifyST> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Vitrify Test")),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(url),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Vitrify(
                radius: BorderRadius.circular(20),
                child: Floater(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.free_breakfast_rounded),
                    label: const Text("Vitrify Test",
                        style: TextStyle(fontSize: 20)),
                  ),
                ),
              ),
              const SizedBox(width: 50),
              Vitrify(
                opacity: 0.2,
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: const Text(
                      "Glassmorphism is a style which, as the name implies, uses properties of glass to enhance your designs. It gives a translucent or transparent look and feel to its elements.",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 50),
              Vitrify(
                color: Colors.cyan,
                opacity: 0.2,
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: const Text(
                      "Glassmorphism is a style which, as the name implies, uses properties of glass to enhance your designs. It gives a translucent or transparent look and feel to its elements.",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
