import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../viewmodels/authenti_viewmodel.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late AuthViewModel _authViewModel;

  void checkLogin() async {
    await Future.delayed(Duration(seconds: 2));
    // check for user detail first
    // try {
    //   await _authViewModel.checkLogin();
    //   if (_authViewModel.user == null) {
    //     Navigator.of(context).pushReplacementNamed("/login");
    //   } else {
    //     NotificationService.display(
    //       title: "Welcome back",
    //       body:
    //           "Hello ${_authViewModel.loggedInUser?.username},\n We have been waiting for you.",
    //     );
    //     Navigator.of(context).pushReplacementNamed("/dashboard");
    //   }
    // } catch (e) {
    //   Navigator.of(context).pushReplacementNamed("/login");
    // }
  }

  @override
  void initState() {
    _authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    checkLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "Images/SplashScreen.jpg",
              ),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 1.5,
                  left: 25,
                  right: 25),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.8),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Text("We will help you to find the ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold)),
                        Text("best experiences and",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold)),
                        Text("adventures ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          alignment: Alignment.center,
                          backgroundColor: Colors.lightGreenAccent,
                          fixedSize: Size(150, 50)),
                      onPressed: () {
                        Navigator.of(context).pushNamed("/userLogin");
                      },
                      child: Row(
                        children: [
                          Text(
                            "Get Started",
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.arrow_forward),
                        ],
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
