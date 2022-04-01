import 'package:admin/main_screen/users/users.dart';
import 'package:admin/model/json_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class UDetails extends StatefulWidget {

  final UserModel model;
  final String userID;
  final int value;

  UDetails({required this.model,
    required this.userID,
    required this.value,});

  @override
  _UDetailsState createState() => _UDetailsState();
}

class _UDetailsState extends State<UDetails> {
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
            Route newRoute = MaterialPageRoute(builder: (_) => User());
            Navigator.pushReplacement(context, newRoute);
          },
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'User',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontFamily: "Lobster",
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.model.sellerName.toString(),
                style: const TextStyle(
                  fontSize: 35,
                  color: Colors.black54,
                  fontFamily: "Signatra",
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text('User ID : ' + widget.userID),
              const Divider(
                thickness: 4,
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                height: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  image: DecorationImage(
                    image: NetworkImage(widget.model.sellerAvatar.toString()),
                    fit: BoxFit.fitWidth,
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
                'Address: ' + widget.model.address,
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
                'Email: ' + widget.model.sellerEmail,
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
                'Status: ' + widget.model.status,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                  fontFamily: "Varela Round",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(child: _buildChild())
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildChild() {
    if (widget.model.status == "approved") {
      return ElevatedButton(
        child: const Text('Disable rider account'),
        onPressed: () {
          final docParcel = FirebaseFirestore.instance
              .collection('sellers')
              .doc(widget.userID);
          docParcel.update({
            'status': 'disabled',
          });
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => User()));
        },
      );
    }
    return ElevatedButton(
      child: const Text('Enable rider account'),
      onPressed: () {
        final docParcel = FirebaseFirestore.instance
            .collection('sellers')
            .doc(widget.userID);
        docParcel.update({
          'status': 'approved',
        });
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => User()));
      },
    );
  }
}
