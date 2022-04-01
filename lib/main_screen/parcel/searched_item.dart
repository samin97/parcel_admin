import 'package:admin/main_screen/home_screen.dart';
import 'package:admin/main_screen/parcel/parcel.dart';
import 'package:admin/main_screen/parcel/parcel_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../model/json_parcel.dart';

class SearchItem extends StatefulWidget {
  @override
  _SearchItemState createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  String query = '';
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  _onSearchChanged() {
    print(_searchController.text);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

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
            MaterialPageRoute(builder: (_) =>  Parcel());
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
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: TextField(
                    controller: _searchController,
                    decoration: const InputDecoration(
                      hintText: "pickup location",
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: FloatingActionButton(
                    backgroundColor: Theme.of(context).primaryColor,
                    child: Icon(Icons.done, size: 40),
                    onPressed: () => setState(() {}),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("parcel")
                      .where('pick', isEqualTo: _searchController.text)
                      .snapshots(),
                  builder: (context, snapshot) {
                    return !snapshot.hasData
                        ? const Center(child: CircularProgressIndicator())
                        : snapshot.data!.docs.isEmpty
                        ? Container()
                        : ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
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
