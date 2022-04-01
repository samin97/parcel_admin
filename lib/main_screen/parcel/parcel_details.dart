import 'package:admin/main_screen/parcel/parcel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../model/json_parcel.dart';
class PDetails extends StatefulWidget {

  final Order model;
  final String orderID;
  final int value;

  PDetails({required this.model,
    required this.orderID,
    required this.value,});

  @override
  _PDetailsState createState() => _PDetailsState();
}

class _PDetailsState extends State<PDetails> {
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
            Route newRoute = MaterialPageRoute(builder: (_) => Parcel());
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
        automaticallyImplyLeading: true,
      ),

      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.model.title.toString(),
                style: const TextStyle(
                  fontSize: 35,
                  color: Colors.black54,
                  fontFamily: "Signatra",
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text('Parcel ID : ' + widget.orderID),
              const Divider(
                thickness: 4,
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                height: 225,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  image: DecorationImage(
                    image: NetworkImage(widget.model.parcelImageUrl.toString()),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Divider(
                thickness: 4,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Details: ' + widget.model.detail,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                  fontFamily: "Varela Round",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'From: ' + widget.model.pick,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                  fontFamily: "Varela Round",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'To: ' + widget.model.drop,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                  fontFamily: "Varela Round",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Price: Rs' + widget.model.price,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                  fontFamily: "Varela Round",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Phone: ' + widget.model.phone,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                  fontFamily: "Varela Round",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Weight: ' + widget.model.weight + 'kg',
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                  fontFamily: "Varela Round",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'User ID: ' + widget.model.sellerUID,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                  fontFamily: "Varela Round",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Rider ID: ' + widget.model.rid,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                  fontFamily: "Varela Round",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
