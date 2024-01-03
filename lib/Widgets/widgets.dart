import 'package:flutter/material.dart';

void chooseColor({
  required BuildContext context,
  required Size size,
  required Function(Color) selectedColor,
}) {
  showDialog(
    context: context,
    builder: (ctx) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text("Choose Color"),
        content: SizedBox(
          height: size.height * 0.3,
          width: size.width * 0.2,
          child: ColorPickerPalette(
            onSelectColor: (Color value) {
              selectedColor(value);
              Navigator.pop(context);
            },
          ),
        ),
      );
    },
  );
}

class ColorPickerPalette extends StatefulWidget {
  final Function(Color) onSelectColor;
  const ColorPickerPalette({
    Key? key,
    required this.onSelectColor,
  }) : super(key: key);

  @override
  ColorPickerPaletteState createState() => ColorPickerPaletteState();
}

class ColorPickerPaletteState extends State<ColorPickerPalette> {
  Color selectedColor = Colors.amber;
  ScrollController scrollController = ScrollController();

  void _onColorSelected(Color color) {
    setState(() {
      selectedColor = color;
      widget.onSelectColor(selectedColor);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: scrollController,
      thumbVisibility: true,
      interactive: true,
      thickness: 8,
      child: ListView(
        controller: scrollController,
        children: [
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 4,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: <Widget>[
              buildColor(Colors.red.shade50),
              buildColor(Colors.red.shade100),
              buildColor(Colors.red.shade200),
              buildColor(Colors.red.shade300),
              buildColor(Colors.red.shade400),
              buildColor(Colors.red),
              buildColor(Colors.red.shade600),
              buildColor(Colors.red.shade700),
              buildColor(Colors.red.shade800),
              buildColor(Colors.red.shade900),
              buildColor(Colors.redAccent),
              buildColor(Colors.redAccent.shade100),
              buildColor(Colors.redAccent.shade400),
              buildColor(Colors.redAccent.shade700),
              buildColor(Colors.pink.shade50),
              buildColor(Colors.pink.shade100),
              buildColor(Colors.pink.shade200),
              buildColor(Colors.pink.shade300),
              buildColor(Colors.pink.shade400),
              buildColor(Colors.pink),
              buildColor(Colors.pink.shade600),
              buildColor(Colors.pink.shade700),
              buildColor(Colors.pink.shade800),
              buildColor(Colors.pink.shade900),
              buildColor(Colors.purple.shade50),
              buildColor(Colors.purple.shade100),
              buildColor(Colors.purple.shade200),
              buildColor(Colors.purple.shade300),
              buildColor(Colors.purple.shade400),
              buildColor(Colors.purple),
              buildColor(Colors.purple.shade600),
              buildColor(Colors.purple.shade700),
              buildColor(Colors.purple.shade800),
              buildColor(Colors.purple.shade900),
              buildColor(Colors.deepPurple.shade50),
              buildColor(Colors.deepPurple.shade100),
              buildColor(Colors.deepPurple.shade200),
              buildColor(Colors.deepPurple.shade300),
              buildColor(Colors.deepPurple.shade400),
              buildColor(Colors.deepPurple),
              buildColor(Colors.deepPurple.shade600),
              buildColor(Colors.deepPurple.shade700),
              buildColor(Colors.deepPurple.shade800),
              buildColor(Colors.deepPurple.shade900),
              buildColor(Colors.deepPurple.shade900),
              buildColor(Colors.indigo.shade50),
              buildColor(Colors.indigo.shade100),
              buildColor(Colors.indigo.shade200),
              buildColor(Colors.indigo.shade300),
              buildColor(Colors.indigo.shade400),
              buildColor(Colors.indigo),
              buildColor(Colors.indigo.shade600),
              buildColor(Colors.indigo.shade700),
              buildColor(Colors.indigo.shade800),
              buildColor(Colors.indigo.shade900),
              buildColor(Colors.blue.shade50),
              buildColor(Colors.blue.shade100),
              buildColor(Colors.blue.shade200),
              buildColor(Colors.blue.shade300),
              buildColor(Colors.blue.shade400),
              buildColor(Colors.blue),
              buildColor(Colors.blue.shade600),
              buildColor(Colors.blue.shade700),
              buildColor(Colors.blue.shade800),
              buildColor(Colors.blue.shade900),
              buildColor(Colors.lightBlue.shade50),
              buildColor(Colors.lightBlue.shade100),
              buildColor(Colors.lightBlue.shade200),
              buildColor(Colors.lightBlue.shade300),
              buildColor(Colors.lightBlue.shade400),
              buildColor(Colors.lightBlue),
              buildColor(Colors.lightBlue.shade600),
              buildColor(Colors.lightBlue.shade700),
              buildColor(Colors.lightBlue.shade800),
              buildColor(Colors.lightBlue.shade900),
              buildColor(Colors.cyan.shade50),
              buildColor(Colors.cyan.shade100),
              buildColor(Colors.cyan.shade200),
              buildColor(Colors.cyan.shade300),
              buildColor(Colors.cyan.shade400),
              buildColor(Colors.cyan),
              buildColor(Colors.cyan.shade600),
              buildColor(Colors.cyan.shade700),
              buildColor(Colors.cyan.shade800),
              buildColor(Colors.cyan.shade900),
              buildColor(Colors.teal.shade50),
              buildColor(Colors.teal.shade100),
              buildColor(Colors.teal.shade200),
              buildColor(Colors.teal.shade300),
              buildColor(Colors.teal.shade400),
              buildColor(Colors.teal),
              buildColor(Colors.teal.shade600),
              buildColor(Colors.teal.shade700),
              buildColor(Colors.teal.shade800),
              buildColor(Colors.teal.shade900),
              buildColor(Colors.green.shade50),
              buildColor(Colors.green.shade100),
              buildColor(Colors.green.shade200),
              buildColor(Colors.green.shade300),
              buildColor(Colors.green.shade400),
              buildColor(Colors.green),
              buildColor(Colors.green.shade600),
              buildColor(Colors.green.shade700),
              buildColor(Colors.green.shade800),
              buildColor(Colors.green.shade900),
              buildColor(Colors.lightGreen.shade50),
              buildColor(Colors.lightGreen.shade100),
              buildColor(Colors.lightGreen.shade200),
              buildColor(Colors.lightGreen.shade300),
              buildColor(Colors.lightGreen.shade400),
              buildColor(Colors.lightGreen),
              buildColor(Colors.lightGreen.shade600),
              buildColor(Colors.lightGreen.shade700),
              buildColor(Colors.lightGreen.shade800),
              buildColor(Colors.lightGreen.shade900),
              buildColor(Colors.lime.shade50),
              buildColor(Colors.lime.shade100),
              buildColor(Colors.lime.shade200),
              buildColor(Colors.lime.shade300),
              buildColor(Colors.lime.shade400),
              buildColor(Colors.lime),
              buildColor(Colors.lime.shade600),
              buildColor(Colors.lime.shade700),
              buildColor(Colors.lime.shade800),
              buildColor(Colors.lime.shade900),
              buildColor(Colors.yellow.shade50),
              buildColor(Colors.yellow.shade100),
              buildColor(Colors.yellow.shade200),
              buildColor(Colors.yellow.shade300),
              buildColor(Colors.yellow.shade400),
              buildColor(Colors.yellow),
              buildColor(Colors.yellow.shade600),
              buildColor(Colors.yellow.shade700),
              buildColor(Colors.yellow.shade800),
              buildColor(Colors.yellow.shade900),
              buildColor(Colors.amber.shade50),
              buildColor(Colors.amber.shade100),
              buildColor(Colors.amber.shade200),
              buildColor(Colors.amber.shade300),
              buildColor(Colors.amber.shade400),
              buildColor(Colors.amber),
              buildColor(Colors.amber.shade600),
              buildColor(Colors.amber.shade700),
              buildColor(Colors.amber.shade800),
              buildColor(Colors.amber.shade900),
              buildColor(Colors.orange.shade50),
              buildColor(Colors.orange.shade100),
              buildColor(Colors.orange.shade200),
              buildColor(Colors.orange.shade300),
              buildColor(Colors.orange.shade400),
              buildColor(Colors.orange),
              buildColor(Colors.orange.shade600),
              buildColor(Colors.orange.shade700),
              buildColor(Colors.orange.shade800),
              buildColor(Colors.orange.shade900),
              buildColor(Colors.deepOrange.shade50),
              buildColor(Colors.deepOrange.shade100),
              buildColor(Colors.deepOrange.shade200),
              buildColor(Colors.deepOrange.shade300),
              buildColor(Colors.deepOrange.shade400),
              buildColor(Colors.deepOrange),
              buildColor(Colors.deepOrange.shade600),
              buildColor(Colors.deepOrange.shade700),
              buildColor(Colors.deepOrange.shade800),
              buildColor(Colors.deepOrange.shade900),
              buildColor(Colors.brown.shade50),
              buildColor(Colors.brown.shade100),
              buildColor(Colors.brown.shade200),
              buildColor(Colors.brown.shade300),
              buildColor(Colors.brown.shade400),
              buildColor(Colors.brown),
              buildColor(Colors.brown.shade600),
              buildColor(Colors.brown.shade700),
              buildColor(Colors.brown.shade800),
              buildColor(Colors.brown.shade900),
              buildColor(Colors.grey.shade50),
              buildColor(Colors.grey.shade100),
              buildColor(Colors.grey.shade200),
              buildColor(Colors.grey.shade300),
              buildColor(Colors.grey.shade400),
              buildColor(Colors.grey),
              buildColor(Colors.grey.shade600),
              buildColor(Colors.grey.shade700),
              buildColor(Colors.grey.shade800),
              buildColor(Colors.grey.shade900),
              buildColor(Colors.blueGrey.shade50),
              buildColor(Colors.blueGrey.shade100),
              buildColor(Colors.blueGrey.shade200),
              buildColor(Colors.blueGrey.shade300),
              buildColor(Colors.blueGrey.shade400),
              buildColor(Colors.blueGrey),
              buildColor(Colors.blueGrey.shade600),
              buildColor(Colors.blueGrey.shade700),
              buildColor(Colors.blueGrey.shade800),
              buildColor(Colors.blueGrey.shade900),
              buildColor(Colors.white),
              buildColor(Colors.black),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildColor(Color color) {
    return InkWell(
      borderRadius: BorderRadius.circular(120),
      onTap: () => _onColorSelected(color),
      child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: color)),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}

class IncrementDecrementNumber extends StatefulWidget {
  final ValueChanged<int> onCountChange;

  /// default count = 1
  final int count;
  const IncrementDecrementNumber({Key? key, required this.onCountChange, this.count = 1}) : super(key: key);

  @override
  State<IncrementDecrementNumber> createState() => _IncrementDecrementNumberState();
}

class _IncrementDecrementNumberState extends State<IncrementDecrementNumber> {
  int _itemCount = 1;
  @override
  void initState() {
    _itemCount = widget.count;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _itemCount != 0
            ? IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () => setState(
                  () {
                    _itemCount--;
                    widget.onCountChange(_itemCount);
                  },
                ),
              )
            : Container(),
        const SizedBox(width: 10),
        Text(_itemCount.toString()),
        const SizedBox(width: 10),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () => setState(
            () {
              _itemCount++;
              widget.onCountChange(_itemCount);
            },
          ),
        )
      ],
    );
  }
}
