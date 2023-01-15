import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_column.dart';
import 'app_icon.dart';
import 'expandable_text_Widget.dart';

class PlaceDescription extends StatelessWidget {
  final String text;

  const PlaceDescription({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Positioned(
            left: 0,
            right: 0,
            child: Container(
                width: double.maxFinite,
                //takes all available width
                height: MediaQuery.of(context).size.height / 2.2,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("Assets/Images/Airplane.png"))))),
        Positioned(
            top: MediaQuery.of(context).size.width * 0.1,
            left: MediaQuery.of(context).size.width * 0.04,
            right: MediaQuery.of(context).size.width * 0.03,
            child: InkWell(
              child: Row(
                children: [
                  AppIcon(icon: Icons.arrow_back),
                ],
              ),
              onTap: () {
                Navigator.of(context).pop("/smallcontainer");
              },
            )),
        Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: MediaQuery.of(context).size.height / 2.5,
            child: Container(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.height * 0.04,
                  right: MediaQuery.of(context).size.height * 0.03,
                  top: MediaQuery.of(context).size.height * 0.03,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40)),
                    color: Colors.white),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        text,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        child: const SingleChildScrollView(
                          child: ExpandableTextWidget(
                            Des_text:
                                "Pokhara is considered the tourism capital "
                                "of Nepal,[9] being a base for trekkers undertaking"
                                " the Annapurna Circuit through the Annapurna Conservation "
                                "Area region[10] of the Annapurna ranges in the Himalayas. "
                                "The city is also home to many of the elite Gurkha soldiers, "
                                "soldiers native to South Asia of Nepalese nationality recruited for the British Army,"
                                " Nepalese Army, Indian Army, Gurkha Contingent Singapore, Gurkha Reserve Unit Brunei,"
                                " UN peacekeeping"
                                " forces and in war zones around the world.[11]",
                          ),
                        ),
                      ),
                      AppColumn(),
                      SizedBox(
                        height: 15,
                      ),
                    ]))),
      ]),
      bottomNavigationBar: Container(
        height: 75,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.lightGreenAccent,
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  Text("no. of people",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  Icon(Icons.remove, color: Colors.white),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "0",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.add, color: Colors.white)
                ],
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreenAccent,
                    // minimumSize: Size.fromHeight(40),
                    padding: EdgeInsets.only(
                      left: 30,
                      right: 30,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    elevation: 3),
                onPressed: () {
                  Navigator.of(context).pushNamed("/dashboard");
                },
                child: Text("Book Now",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ))),
          ],
        ),
      ),
    );
  }
}
