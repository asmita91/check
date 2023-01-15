
import 'package:flutter/material.dart';
import '../Navpages/Home.dart';
import '../Navpages/ProfilePage.dart';
import 'AdminRatingReview.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  List pages=[
    Home(),
    AdminRatingReview(),
    // NotificationService(),
    ProfilePage(),

  ];

  int currentIndex=0;
  void onTap(int index){
    setState(() {
      currentIndex=index;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: currentIndex,

        unselectedFontSize: 0,
        selectedFontSize: 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label:"Home"),
          BottomNavigationBarItem(icon: Icon(Icons.rate_review),label:"Rate and Review"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications ),label: "Notifications"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label:"Admin Profile" ),
        ],
      ),
    );
  }
}
