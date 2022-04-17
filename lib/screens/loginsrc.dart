import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:test2/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'homesrc.dart';

class LoginSrc extends StatefulWidget {
  const LoginSrc({Key? key}) : super(key: key);

  @override
  _LoginSrcState createState() => _LoginSrcState();
}

class _LoginSrcState extends State<LoginSrc> {
  final _formKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;
  bool load = false;

  @override
  Widget build(BuildContext context) {
    //email field
    final emailField = TextFormField(
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //password field
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordController,
        obscureText: true,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
        },
        onSaved: (value) {
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: TextButton(
          onPressed: () {
            signIn(emailController.text, passwordController.text);
          },
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            child: Text(
              "Login",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          )),
    );

    return Scaffold(
      backgroundColor: newbg,
      body: Stack(children: [
        Center(
          child: SingleChildScrollView(
            child: Container(
              color: newbg,
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white),
                  width: MediaQuery.of(context).size.width / 3,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                            height: 100,
                            width: 150,
                            child: Image.asset(
                              "assets/icons/imaicon.png",
                              fit: BoxFit.contain,
                              filterQuality: FilterQuality.high,
                            )),
                        SizedBox(height: 45),
                        emailField,
                        SizedBox(height: 25),
                        passwordField,
                        SizedBox(height: 35),
                        loginButton,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Center(
          child: load
              ? CircularProgressIndicator(
                  color: Colors.redAccent,
                )
              : null,
        )
      ]),
    );
  }

  // login function
  void signIn(String email, String password) async {
    // firebase
    if (_formKey.currentState!.validate()) {
      setState(() {
        load = true;
      });
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            // .signInWithEmailAndPassword(
            //     email: "o@gmail.com", password: "12345678")
            .then((uid) => {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => OfficeHome())),
                });
      } catch (error) {
        print(error);
        setState(() {
          load = false;
        });
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return SimpleCustomAlert("Email or Password is incorrect!");
            });
      }
    }
  }
}

class SimpleCustomAlert extends StatelessWidget {
  final title;
  SimpleCustomAlert(this.title);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.redAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Container(
        height: 200,
        width: 450,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.warning_amber_rounded,
                    color: primarybg,
                    size: 30,
                  ),
                  Text(
                    " Error",
                    style: TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Incorrect username or password",
              style: TextStyle(
                fontFamily: "Nunito",
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 28,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              color: white,
              child: Text(
                "Okay",
                style: TextStyle(
                  fontFamily: "Nunito",
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
