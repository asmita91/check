import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Colors.dart';
import 'Places.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({Key? key}) : super(key: key);

  @override
  State<UserHomePage> createState() => _PlacesState();
}

class _PlacesState extends State<UserHomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start,
// 1st Children
            children: [
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.07,
              right: MediaQuery.of(context).size.width * 0.02,
              left: MediaQuery.of(context).size.width * 0.04,
            ),
            child: Row(
              children: [
                Icon(Icons.menu, size: 30, color: Colors.black54),
                Expanded(child: Container()),

// menu text
//                     Container(
//                       margin: EdgeInsets.only(
//                           right: MediaQuery.of(context).size.width * 0.03),
//                       width: 50,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: Colors.grey.withOpacity(0.5),
//                       ),
//                     ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.04),
            child: Text(
              "Discover",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(height: 15),
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                labelPadding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.04),
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicator:
                    CircleTabIndicator(colors: AppColor.HomePage, radius: 4),
                tabs: [
                  Tab(text: "Places"),
                  Tab(text: "Booking"),
                  Tab(text: "Emotions"),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 600,
            child: TabBarView(
              controller: _tabController,
              children: [PlaceDetails(), Text("hi"), Text("Contents")],
              // Transportation(),
            ),
          )
        ]));
  }
}

class CircleTabIndicator extends Decoration {
  final Color colors;
  double radius;
  CircleTabIndicator({required this.colors, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
// TODO: implement createBoxPainter
    return _CirclePainter(colors: Colors.black, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color colors;
  double radius;
  _CirclePainter({required this.colors, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = colors;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
