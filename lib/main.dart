import 'package:firebase_auth/firebase_auth.dart';
import 'package:poll/locator.dart';
import 'package:poll/models/screen.dart';
import 'package:poll/pages/auth/login_signup_page.dart';
import 'package:flutter/material.dart';
import 'package:poll/services/authenticate.dart';
import 'package:poll/wrapper.dart';
import 'package:provider/provider.dart';

import 'models/CRUDModel.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return StreamProvider<FirebaseUser>.value(
    return MultiProvider(
        providers: [
          StreamProvider<FirebaseUser>.value(value: AuthService().user),
          ChangeNotifierProvider(create: (_) => locator<CRUDModel>()),
          ChangeNotifierProvider(create: (_) => ScreenModel()),
        ],
        child: MaterialApp(
          title: "Polloid",
          theme: new ThemeData(
              // This is the theme of your application.
              //
              // Try running your application with "flutter run". You'll see the
              // application has a blue toolbar. Then, without quitting the app, try
              // changing the primarySwatch below to Colors.green and then invoke
              // "hot reload" (press "r" in the console where you ran "flutter run",
              // or simply save your changes to "hot reload" in a Flutter IDE).
              // Notice that the counter didn't reset back to zero; the application
              // is not restarted.
              primarySwatch: Colors.blue,
              primaryColor: Colors.black,
              primaryIconTheme: IconThemeData(color: Colors.black),
              primaryTextTheme: TextTheme(
                  headline6:
                      TextStyle(color: Colors.black, fontFamily: "Aveny")),
              textTheme: TextTheme(headline6: TextStyle(color: Colors.black))),
          home: Wrapper(),
        ));
  }
}
