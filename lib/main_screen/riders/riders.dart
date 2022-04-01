import 'package:admin/main_screen/home_screen.dart';
import 'package:admin/main_screen/riders/riders_card.dart';
import 'package:admin/model/json_rider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Rider extends StatefulWidget {
  @override
  _RiderState createState() => _RiderState();
}

class _RiderState extends State<Rider> {
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
          'Riders',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontFamily: "Lobster",
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection("rider").snapshots(),
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
                            return RCard(
                              value: index,
                              userID: snapshot.data!.docs[index].id,
                              userModel: UserModel.fromJson(
                                  snapshot.data!.docs[index].data()
                                      as Map<String, dynamic>),
                            );
                          },
                        );
            }),
      ),
    );
  }
}
