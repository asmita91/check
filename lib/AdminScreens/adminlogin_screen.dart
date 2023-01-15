import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({super.key});

  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreen();
}


class _AdminLoginScreen extends State<AdminLoginScreen> {
  TextEditingController email = new TextEditingController();
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();
  bool password_view = false;
  final form = GlobalKey<FormState>();
  showHidePassword() {
    setState(() {
      password_view = !password_view;
    });
  }

  Widget showVisibilityIcon(bool showPassword) {
    return showPassword == password_view
        ? InkWell(
        onTap: () {
          setState(() {
            password_view = !password_view;
          });
        },
        child: Icon(Icons.remove_red_eye,color: Colors.white,))
        : InkWell(
        onTap: () {
          setState(() {
            password_view = !password_view;
          });
        },
        child: Icon(Icons.panorama_fish_eye,color: Colors.white,));
  }

  hintStyle() {
    TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
  }

  formsOutline() {
    OutlineInputBorder(
        borderSide: BorderSide(
            width: 2, color: Colors.white),
        borderRadius: BorderRadius.circular(30));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('Assets/Images/admin login.jpg'), fit:BoxFit.cover)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.4,
                    right: 30,
                    left: 30,
                    bottom: MediaQuery.of(context).size.height * 0.4,
                  ),
                  height: MediaQuery.of(context).size.height * 0.5,
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                      color: Colors.transparent.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(30)),
                  child: Form(
                    key: form,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(

                            style: TextStyle(color: Colors.white),
                            controller: email,

                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "Email is required";
                              }
                              if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+.com")
                                  .hasMatch(value)) {
                                return "Please enter valid email";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1, color: Colors.white,
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.white,
                                ),
                                hintText: "Email",
                                hintStyle: hintStyle()),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            style: TextStyle(color: Colors.white),
                            controller: username,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "Username is required";
                              }
                              if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                                return "Please enter valid username";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1, color: Colors.white,
                                    )
                                ),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                ),
                                hintText: "Username",
                                hintStyle: hintStyle()),

                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            style: TextStyle(color: Colors.white),
                            controller: password,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "password is required";
                              }
                              if (value.length < 6 || value.length > 10) {
                                return "enter password of 6 to 10 characters";
                              }
                              return null;
                            },
                            obscureText: !password_view,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1, color: Colors.white,
                                    )
                                ),
                                prefixIcon:
                                Icon(Icons.key, color: Colors.white),
                                hintText: "Password",
                                hintStyle: hintStyle(),
                                suffixIcon:
                                showVisibilityIcon(password_view)),
                            // validator: Validators(),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.lightGreen),
                            onPressed: () {
                              if (form.currentState!.validate()) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text("Login validation successful"),
                                ));
                                Navigator.of(context).pushNamed("/admindashboard");
                              } else {
                                print("Invalid form");
                              }
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),],
                            ),
                          ),
                        ]),
                  ))],
          ),
        ),
      ),
    );
  }
}