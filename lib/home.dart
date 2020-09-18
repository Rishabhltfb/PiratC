import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

final nameController = TextEditingController();

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
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Column(
                      children: [
                        Text(
                          "Enter team ID",
                        ),
                      ],
                    ),
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
