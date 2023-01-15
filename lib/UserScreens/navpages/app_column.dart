import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'icons_text_widget.dart';

class AppColumn extends StatelessWidget {
  const AppColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("Pokhara",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Wrap(
                children: List.generate(
                    5,
                        (index) => Icon(Icons.star,
                        color: Colors.lightGreenAccent, size: 15)),
              ),
              SizedBox(width: 10),
              Row(children: [
                Icon(Icons.thumb_up, color: Colors.orange),
                SizedBox(width: 5),
                Text("top rated",
                    style: TextStyle(fontSize: 15, color: Colors.lightGreen))
              ])
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconAndTextWidget(
                  icon: Icons.timelapse_sharp,
                  subText: "5days",
                  iconColor: Colors.blue),
              IconAndTextWidget(
                  icon: Icons.star, subText: "Rates", iconColor: Colors.yellow),
              Text("10k", style: TextStyle(fontSize: 20))
            ],
          )
        ],
      ),
    );
  }
}
