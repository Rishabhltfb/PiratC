import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

void main() => runApp(AR());

class AR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Treasure AR',
      home: Meet(title: 'Treasure AR'),
    );
  }
}

class Meet extends StatefulWidget {
  Meet({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MeetState createState() => _MeetState();
}

class _MeetState extends State<Meet> {
  ArCoreController arCoreController;

  _onArCoreViewCreated(ArCoreController _arcoreController) {
    arCoreController = _arcoreController;
    _addCube(arCoreController);
  }

  _addCube(ArCoreController _arcoreController) {
    final material = ArCoreMaterial(
      color: Colors.pink,
      metallic: 1,
    );
    final cube = ArCoreCube(
      materials: [material],
      size: vector.Vector3(1, 1, 1),
    );
    final node = ArCoreNode(
      shape: cube,
      position: vector.Vector3(
        -0.5,
        -0.5,
        -3,
      ),
    );

    _arcoreController.addArCoreNode(node);
  }

  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Hexcolor('#FFDFCA'),
        flexibleSpace: Image(
          image: AssetImage('images/game.png'),
          fit: BoxFit.cover,
        ),
        title: Text(
          widget.title,
          style: TextStyle(fontFamily: 'Gotham', color: Hexcolor('#5C6178')),
        ),
      ),
      body: ArCoreView(
        onArCoreViewCreated: _onArCoreViewCreated,
      ),
    );
  }
}
