import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/UserModel.dart';
import '../viewmodels/authenti_viewmodel.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  @override
  State<RegisterScreen> createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  TextEditingController username = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController confirmpassword = new TextEditingController();
  bool changePaswordState = false;
  late AuthViewModel _authen;
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
        child: Icon(Icons.key))
        : InkWell(
        onTap: () {
          setState(() {
            changePaswordState = !changePaswordState;
          });
        },
        child: Icon(Icons.key_off));
  }
  hintStyle() {
    TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
  }
  outlineForInputField() {
    OutlineInputBorder(
        borderSide: BorderSide(width: 2, color: Colors.white),
        borderRadius: BorderRadius.circular(20));
  }

  void initState() {
    _authen = Provider.of<AuthViewModel>(context, listen: false);
    super.initState();
  }

  void register() async{
    if(_formkey.currentState == null || !_formkey.currentState!.validate()){
      return;
    }
    try{
      await _authen.register(
          UserModel(
              username: username.text,
              email: email.text,
              password: password.text,
          )).then((value) {
        Navigator.of(context).pushReplacementNamed("/userLogin");
      })
          .catchError((e){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message.toString())));
      });
    }catch(err){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(err.toString())));
    }
  }
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/register.jpg'), fit: BoxFit.cover)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5,
                    right: 15,
                    left: 15,
                    bottom: MediaQuery.of(context).size.height * 0.1,
                  ),
                  height: MediaQuery.of(context).size.height * 0.6,
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(20)),
                  child: Form(
                    key: _formkey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            controller:username,
                            decoration: InputDecoration(
                              label: Text("username"),
                              hintText: "Please enter your username",
                              prefixIcon: Icon(Icons.man),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            style: TextStyle(color: Colors.white70),
                            controller: email,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "Email is required";
                              }
                              if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                                return "Please enter valid email";                               }
                              return null;                             },
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,color: Colors.white,
                                ),
                              ),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.black,
                              ),
                              hintText: "Email",
                              hintStyle: hintStyle(),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            style: TextStyle(color: Colors.white70),
                            controller: password,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "password is required";                               }
                              if (value.length < 8 || value.length > 10) {
                                return "enter password of 8 to 10 characters";                               }
                              return null; // null return garyo vane chai pass vako ho
                            },
                            obscureText: !changePaswordState,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,color: Colors.white,
                                  ),
                                ),
                                prefixIcon:
                                Icon(Icons.password, color: Colors.black),
                                hintText: "Password",
                                hintStyle: hintStyle(),
                                suffixIcon:
                                showVisibilityIcon(changePaswordState)),
                            // validator: Validators(),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            style: TextStyle(color: Colors.white70),
                            controller: confirmpassword,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "password is required";                               }
                              if (value.length < 8 || value.length > 10) {
                                return "enter password of 8 to 10 characters";                               }
                              return null; // null return garyo vane chai pass vako ho
                            },
                            obscureText: !changePaswordState,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,color: Colors.white,
                                  ),
                                ),
                                prefixIcon:
                                Icon(Icons.password, color: Colors.black),
                                hintText: "Confirm Password",
                                hintStyle: hintStyle(),
                                suffixIcon:
                                showVisibilityIcon(changePaswordState)),
                            // validator: Validators(),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.lightGreen),
                            onPressed: () {
                              register();
                            },
                            child: Text(
                              "Register",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,                           ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
                                InkWell(
                                  child: Text(
                                    "Go to Log In ?",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white70),
                                  ),
                                  onTap: (){
                                    setState(() {
                                      Navigator.of(context).pushReplacementNamed("/userLogin");
                                    });
                                  },
                                ),
                            ],

                            ),
                          ),
                        ]),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}