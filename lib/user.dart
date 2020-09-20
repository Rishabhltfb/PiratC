import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:piratc/home.dart';

class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Hexcolor('#FFDFCA'),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/home.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    color: Hexcolor('#D5CCE6'),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: Hexcolor('#D5CCE6'),
                            backgroundImage: AssetImage('images/pirate.png'),
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                nameController.text,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Gotham',
                                    fontSize: 20),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "AVB672A",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Gotham',
                                    fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("images/game.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      height: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Score",
                              style:
                                  TextStyle(fontFamily: 'Gotham', fontSize: 20),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "1",
                                style: TextStyle(
                                    fontFamily: 'Gotham', fontSize: 40),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Your team score: 5",
                              style:
                                  TextStyle(fontFamily: 'Gotham', fontSize: 20),
                            ),
                          ),
                          Row(
                            children: [],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "High Scores:",
                    style: TextStyle(
                        fontFamily: 'Gotham',
                        fontSize: 20,
                        color: Hexcolor('#5C6178')),
                  ),
                ),
                Card(
                  color: Hexcolor('#A1F0F2'),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/code.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Card(
                            color: Hexcolor('#FFF5FF'),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: CircleAvatar(
                                        backgroundColor: Hexcolor('#FFF5FF'),
                                        backgroundImage:
                                            AssetImage('images/pirate.png'),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        "DragonHunter: 36",
                                        style: TextStyle(fontFamily: 'Gotham'),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Card(
                            color: Hexcolor('#C8FCEA'),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: CircleAvatar(
                                        backgroundColor: Hexcolor('#C8FCEA'),
                                        backgroundImage:
                                            AssetImage('images/pirate.png'),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        "Lightsaber: 34",
                                        style: TextStyle(fontFamily: 'Gotham'),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Card(
                            color: Hexcolor('#F9F871'),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: CircleAvatar(
                                        backgroundColor: Hexcolor('#F9F871'),
                                        backgroundImage:
                                            AssetImage('images/pirate.png'),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        "DragonHunter: 36",
                                        style: TextStyle(fontFamily: 'Gotham'),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
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
