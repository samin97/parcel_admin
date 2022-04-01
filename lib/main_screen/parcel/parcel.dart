import 'package:admin/main_screen/home_screen.dart';
import 'package:admin/main_screen/parcel/parcel_card.dart';
import 'package:admin/main_screen/parcel/searched_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../model/json_parcel.dart';

class Parcel extends StatefulWidget {
  @override
  _ParcelState createState() => _ParcelState();
}

class _ParcelState extends State<Parcel> {
  String query = '';

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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Route newRoute =
                MaterialPageRoute(builder: (_) => const HomeScreen());
            Navigator.pushReplacement(context, newRoute);
          },
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Parcels',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontFamily: "Lobster",
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
                Route newRoute =
                    MaterialPageRoute(builder: (context) => SearchItem());
                Navigator.pushReplacement(context, newRoute);
              },
              icon: const Icon(Icons.search, color: Colors.white), label: const Text(""),
              )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("parcel")
                      .snapshots(),
                  builder: (context, snapshot) {
                    return !snapshot.hasData
                        ? const Center(child: CircularProgressIndicator())
                        : snapshot.data!.docs.isEmpty
                            ? Container()
                            : ListView.builder(
                                itemCount: snapshot.data!.docs.length,
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return PCard(
                                    value: index,
                                    orderID: snapshot.data!.docs[index].id,
                                    model: Order.fromJson(
                                        snapshot.data!.docs[index].data()
                                            as Map<String, dynamic>),
                                  );
                                },
                              );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
