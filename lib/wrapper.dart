import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:poll/pages/app/home.dart';
import 'package:poll/pages/auth/login_signup_page.dart';
import 'package:provider/provider.dart';

import 'models/CRUDModel.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<FirebaseUser>(context);
    return _user == null ? LoginScreen() : PollHome();
  }
}
