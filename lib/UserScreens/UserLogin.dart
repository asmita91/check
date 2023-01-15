import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/authenti_viewmodel.dart';

class UserLoginPage extends StatefulWidget {
  const UserLoginPage({Key? key}) : super(key: key);

  @override
  State<UserLoginPage> createState() => _UserLoginPageState();
}

class _UserLoginPageState extends State<UserLoginPage> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  bool changePaswordState = false;
  final _formkey = GlobalKey<FormState>();
  showHidePassword() {
    setState(() {
      changePaswordState = !changePaswordState;
    });
  }
  Widget showVisibilityIcon(bool showPassword) {
    return showPassword == changePaswordState
        ? InkWell(
            onTap: () {
              setState(() {
                changePaswordState = !changePaswordState;
              });
            },
            child: Icon(Icons.hide_source_outlined))
        : InkWell(
            onTap: () {
              setState(() {
                changePaswordState = !changePaswordState;
              });
            },
            child: Icon(Icons.remove_red_eye));
  }
  hintStyle() {
    const TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontSize: 20,
    );
  }
  outlineForInputField() {
    OutlineInputBorder(
        borderSide: BorderSide(width: 2, color: Colors.white),
        borderRadius: BorderRadius.circular(20));
  }
  styleOfText() {
    TextStyle(
      color: Colors.white70,
      fontSize: 18,
    );
  }
  late AuthViewModel _authen;

  void login() async {
    try {
      await _authen.login(email.text, password.text).then((value) {
        Navigator.of(context).pushReplacementNamed('/userDashboard');
      }).catchError((e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message.toString())));
      });
    } catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(err.toString())));
    }
  }
  @override
  void initState() {
    _authen = Provider.of<AuthViewModel>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/admin login.jpg'), fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Form(
            key: _formkey,
            child: SingleChildScrollView(
              child: Container(
                  // alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20)),
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.6,
                    left: MediaQuery.of(context).size.width * 0.05,
                    right: MediaQuery.of(context).size.width * 0.05,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        style: styleOfText(),
                        controller: email,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Email is required";
                          }
                          if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                            return "Please enter valid email";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            enabledBorder: outlineForInputField(),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.black,
                            ),
                            hintText: "Email",
                            hintStyle: hintStyle()),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        style: styleOfText(),
                        controller: password,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "password is required";
                          }
                          if (value.length < 5 || value.length > 10) {
                            return "enter password of 5 to 10 characters";
                          }
                          return null; // null return garyo vane chai pass vako ho
                        },
                        obscureText: !changePaswordState,
                        decoration: InputDecoration(
                            enabledBorder: outlineForInputField(),
                            prefixIcon:
                                Icon(Icons.password, color: Colors.black),
                            hintText: "Password",
                            hintStyle: hintStyle(),
                            suffixIcon: showVisibilityIcon(changePaswordState)),
                        // validator: Validators(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.lightGreen),
                        onPressed: () {
                          login();
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
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Forgot Password?",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white70),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
            ),
          ),
        ));
  }
}
