import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminPayment extends StatefulWidget {
  const AdminPayment({Key? key}) : super(key: key);

  @override
  State<AdminPayment> createState() => _AdminPaymentState();
}

class _AdminPaymentState extends State<AdminPayment> {
  List name = [
    "asmita katel",
    "sanjeela thapa",
    "ritika shrestha",
    "diya dangol",
    "aayush pradhan",
    "asmita katel",
    "sanjeela thapa",
    "ritika shrestha",
    "diya dangol",
    "aayush pradhan"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Payment",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ),
        body: ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) => Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 55,
                                      height: 55,
                                      child: CircleAvatar(
                                        backgroundImage:
                                            AssetImage("Images/hiace.png"),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Text(name[index],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18)),
                                  ],
                                ),
                                RichText(
                                  text: TextSpan(
                                    // Here is the explicit parent TextStyle
                                    style: new TextStyle(color: Colors.black),
                                    children: <TextSpan>[
                                      new TextSpan(text: 'Total received is: '),
                                      new TextSpan(
                                        text: '10k',
                                        style: new TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Text("payment successful!!!")
                          ],
                        ),
                      )),
                )),
        );
  }
}
