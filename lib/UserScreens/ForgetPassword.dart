import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  TextEditingController newPassword = new TextEditingController();
  TextEditingController Confirmpassword = new TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    return Container(
        // decoration: const BoxDecoration(
            // image: DecorationImage(
            //     image: AssetImage('images/Pokhara.jpg'), fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.grey.withOpacity(0.5),
          body: Form(
            key: _formkey,
            child: SingleChildScrollView(
              child: Container(
                // alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                      // color: Colors.grey.withOpacity(0.3),
                    color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5,
                    left: MediaQuery.of(context).size.width * 0.05,
                    right: MediaQuery.of(context).size.width * 0.05,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        style: styleOfText(),
                        controller: newPassword,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Password is required";
                          }
                          if (value.length < 5 || value.length > 10){
                            return "Please enter  password of 5 to 10 character";
                          }
                          return null;
                        },
                        obscureText: !changePaswordState,
                        decoration: InputDecoration(
                            enabledBorder: outlineForInputField(),
                            prefixIcon: Icon(
                              Icons.password_outlined,
                              color: Colors.black,
                            ),
                            hintText: "New Password",
                            hintStyle: hintStyle(),
                            suffixIcon: showVisibilityIcon(changePaswordState)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        style: styleOfText(),
                        controller: Confirmpassword,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Password is required";
                          }

                          if (value!=newPassword) {
                            return "Re-check your password";
                          }

                          return null; // null return garyo vane chai pass vako ho
                        },
                        obscureText: !changePaswordState,
                        decoration: InputDecoration(
                            enabledBorder: outlineForInputField(),
                            prefixIcon:
                            Icon(Icons.password, color: Colors.black),
                            hintText: " Confirm Password",
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
                          if (_formkey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Login validation successful"),
                            ));
                            Navigator.of(context).pushNamed("/dashboard");
                          } else {
                            print("Invalid form");
                          }
                        },
                        child: Text(
                          "Done",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  )),
            ),
          ),
        ));
  }
}
