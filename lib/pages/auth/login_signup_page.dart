import 'package:firebase_auth/firebase_auth.dart';
import 'package:poll/pages/app/home.dart';
import 'package:flutter/material.dart';
import 'package:poll/services/authenticate.dart';

class LoginScreen extends StatelessWidget {
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Container(
          padding: EdgeInsets.only(top: 200, left: 32, right: 32),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.blueGrey[800],
                      fontSize: 36,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 32,
                ),
                TextFormField(
                  enableSuggestions: true,
                  style: TextStyle(fontSize: 24),
                  decoration: InputDecoration(
                    hintText: "eg. +23481...",
                  ),
                  controller: _phoneController,
                ),
                SizedBox(
                  height: 32,
                ),
                Container(
                  width: double.infinity,
                  child: FlatButton(
                    child: Text("LOGIN"),
                    textColor: Colors.white,
                    padding: EdgeInsets.all(16),
                    onPressed: () {
                      final phone = _phoneController.text.trim();

                      AuthService().loginUser(phone, context);
                    },
                    color: Colors.blueGrey[800],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
