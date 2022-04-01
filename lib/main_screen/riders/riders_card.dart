import 'package:admin/main_screen/riders/riders_details.dart';
import 'package:admin/model/json_rider.dart';
import 'package:flutter/material.dart';


class RCard extends StatefulWidget {
  final UserModel userModel;
  final String userID;
  final int value;

  RCard({
    required this.userModel,
    required this.userID,
    required this.value,
  });

  @override
  _RCardState createState() => _RCardState();
}

class _RCardState extends State<RCard> {
  @override
  Widget build(BuildContext context) {
    print('abc');
    return Card(
      color: Colors.grey,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 125,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  image: DecorationImage(
                    image: NetworkImage(widget.userModel.licenseImageUrl.toString()),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    widget.userModel.riderName.toString(),
                    style: const TextStyle(
                      fontSize: 35,
                      color: Colors.black54,
                      fontFamily: "Signatra",
                    ),
                  ),
                  Text(
                    'Rider ID: ' + widget.userID.toString(),
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.black54,
                      fontFamily: "BebasNeue",
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'License no: ' + widget.userModel.license.toString(),
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.black54,
                      fontFamily: "BebasNeue",
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ElevatedButton(
                    child: const Text('Details'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      Route newRoute = MaterialPageRoute(
                          builder: (context) => RDetails(
                            model: widget.userModel,
                            value: widget.value,
                            riderID: widget.userID,
                          ));
                      Navigator.pushReplacement(context, newRoute);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
