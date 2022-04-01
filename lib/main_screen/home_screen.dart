import 'package:admin/main_screen/parcel/parcel.dart';
import 'package:admin/main_screen/riders/riders.dart';
import 'package:admin/main_screen/users/users.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Colors.blue,
              Colors.orange,
            ],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          )),
        ),
        title: const Text(
          'Admin Portal',
          style: TextStyle(
            fontSize: 50,
            color: Colors.white,
            fontFamily: "Lobster",
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Flexible(
              flex: 3,
              child: InkWell(
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        color: Colors.amber[100],
                        child: const Align(
                          child: Text(
                            'User',
                            style: TextStyle(
                              fontSize: 40,
                              color: Colors.black,
                              fontFamily: "Lobster",
                            ),
                          ),
                          alignment: Alignment(0.1, 0.1),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.amber[100],
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(5, 70, 50, 70),
                          child: Image.asset(
                            "images/handset.png",
                            height: 270,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => User()));
                },
              )),
          Flexible(
              flex: 3,
              child: InkWell(
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        color: Colors.lightBlue[100],
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 70, 0, 70),
                          child: Image.asset(
                            "images/rider.png",
                            height: 270,
                            width: 300,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        color: Colors.lightBlue[100],
                        child: const Align(
                          child: Text(
                            'Riders',
                            style: TextStyle(
                              fontSize: 40,
                              color: Colors.black,
                              fontFamily: "Lobster",
                            ),
                          ),
                          alignment: Alignment(-0.5, 0.1),
                        ),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Rider()));
                },
              )),
          Flexible(
              flex: 3,
              child: InkWell(
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        color: Colors.amber[100],
                        child: const Align(
                          child: Text(
                            'Parcels',
                            style: TextStyle(
                              fontSize: 40,
                              color: Colors.black,
                              fontFamily: "Lobster",
                            ),
                          ),
                          alignment: Alignment(0.1, 0.1),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.amber[100],
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 70, 30, 70),
                          child: Image.asset(
                            "images/parcel.png",
                            height: 270,
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Parcel()));
                },
              )),
        ],
      ),
    );
  }
}
