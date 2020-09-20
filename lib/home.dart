import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:piratc/homewidget.dart';

final nameController = TextEditingController();
final codeController = TextEditingController();

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ListItem> _dropdownItems = [
    ListItem(1, "Select:"),
    ListItem(2, "Solo Player"),
    ListItem(3, "Multiplayer"),
  ];

  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _selectedItem;

  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;
  }

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/wallpaper.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Welcome, let's set some stuff right before you start:",
                    style: TextStyle(fontFamily: 'Gotham', fontSize: 20),
                  ),
                ),
                Card(
                  color: Hexcolor('#FFDFCA'),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/game.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Choose Player Mode:",
                            style:
                                TextStyle(fontFamily: 'Gotham', fontSize: 18),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<ListItem>(
                                style: TextStyle(
                                    fontFamily: 'Gotham', color: Colors.black),
                                value: _selectedItem,
                                items: _dropdownMenuItems,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedItem = value;
                                  });
                                }),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Your gaming name",
                            style:
                                TextStyle(fontFamily: 'Gotham', fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 0, 10, 0),
                          child: TextFormField(
                            controller: nameController,
                            style: TextStyle(
                                color: Colors.black, fontFamily: 'Gotham'),
                            decoration: new InputDecoration(
                              enabledBorder: new OutlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.black)),
                              hintStyle: TextStyle(
                                fontFamily: 'Gotham',
                                color: Colors.black54,
                                fontSize: 15,
                                fontStyle: FontStyle.italic,
                              ),
                              labelStyle: TextStyle(
                                  fontFamily: 'Gotham', color: Colors.white),
                              hintText: 'Ex: KnightSlayer, DungeonHunter',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Only for Multiplayer users",
                    style: TextStyle(
                        fontFamily: 'Gotham',
                        fontSize: 15,
                        color: Hexcolor('#5F5C6D')),
                  ),
                ),
                Card(
                  color: Hexcolor('#FFF5FF'),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/code.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Enter team ID",
                            style:
                                TextStyle(fontFamily: 'Gotham', fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 0, 10, 0),
                          child: TextFormField(
                            controller: codeController,
                            style: TextStyle(
                                color: Colors.black, fontFamily: 'Gotham'),
                            decoration: new InputDecoration(
                              enabledBorder: new OutlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.black)),
                              hintStyle: TextStyle(
                                fontFamily: 'Gotham',
                                color: Colors.black54,
                                fontSize: 15,
                                fontStyle: FontStyle.italic,
                              ),
                              labelStyle: TextStyle(
                                  fontFamily: 'Gotham', color: Colors.white),
                              hintText: 'Ex: Hr6ka7',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 15, 10, 10),
                          child: Text(
                            "Generate your own code:",
                            style:
                                TextStyle(fontFamily: 'Gotham', fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 5, 10, 10),
                          child: RaisedButton(
                            color: Hexcolor('#FFF5FF'),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Generate",
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontFamily: 'Gotham'),
                                )
                              ],
                            ),
                            onPressed: () {
                              final snackbar =
                                  SnackBar(content: Text('Code generated!'));
                              Scaffold.of(context).showSnackBar(snackbar);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                        child: RaisedButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Let's go",
                                style: TextStyle(fontFamily: 'Gotham'),
                              ),
                            ],
                          ),
                          onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return HomeWidget();
                              },
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "By proceeding, you agree all terms and conditions",
                          style: TextStyle(
                              fontFamily: 'Gotham',
                              fontStyle: FontStyle.italic,
                              color: Colors.black54),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}
