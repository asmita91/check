import 'package:chahewoneu/AdminScreens/NavBar.dart';
import 'package:flutter/material.dart';
import '../../Colors.dart';



class Home extends StatefulWidget {
  const Home ({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin{
  bool isGrid=true;
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 4, vsync: this);

    return Scaffold(
      drawer: NavBar(),
      // body: Column(
      //
      //     children: [
        // Container(
        //   padding: const EdgeInsets.only(top: 30,right: 335),
        //   margin: const EdgeInsets.only(top: 20),
        //   child: InkWell(
        //        child: Icon(
        //           Icons.menu,
        //           size: 30,
        //           color: Colors.black54,
        //         ),
        //       onTap: (){
        //     Navigator.of(context).pushNamed("/sidebar");
        //   },
        //   ),
        // ),
        appBar:AppBar(
          elevation:0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: AppColor.Events,
          ),
        ),

      body:Column(children: [


        //side bar
        Container(
          padding: const EdgeInsets.only(top: 5),
          margin: const EdgeInsets.only(right: 250),
          child: Text(
            "Discover",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              color: AppColor.Events,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        //text
        SizedBox(height: 30),
        //tab bar
        Container(
          child:TabBar(
              controller: tabController,
              labelColor: Color.fromARGB(255, 93, 171, 210),
              unselectedLabelColor: Colors.black,
              isScrollable: false,
              // isScrollable: true,
              indicatorSize: TabBarIndicatorSize.label,
              // indicator: ,
              tabs: [
                Tab(text: "Places"),
                Tab(
                  text: "Events",
                ),
                Tab(
                  text: "Booking",
                ),
                Tab(
                  text: "Transportation",
                )
              ]),
        ),
        Container(
          height: 300,
          width: double.maxFinite,
          child: TabBarView(controller: tabController, children: [
            Text(" "),
            Text(" "),
            Text(" "),
            Text(" ")
          ]),
        )
      ]),
    );
  }
}

class CircleTabIndicator extends Decoration{
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, radius:radius);
    // throw UnimplementedError();
  }

}
class _CirclePainter extends BoxPainter{
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas,
      Offset offset,
      ImageConfiguration configuration) {
  }

}