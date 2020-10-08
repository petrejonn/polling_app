import 'package:flutter/material.dart';
import 'package:poll/pages/app/my_poll_list.dart';

class MyPolls extends StatelessWidget {
  const MyPolls({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        // Expanded(flex: 1, child: new InstaStories()),
        Flexible(child: MyPollList())
      ],
    );
  }
}
