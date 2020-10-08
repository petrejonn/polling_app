import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:poll/models/pollModel.dart';
import 'package:poll/pages/app/add_poll.dart';
import 'package:poll/pages/app/edit_poll.dart';
import 'package:poll/pages/app/home_body.dart';
import 'package:poll/pages/app/my_polls.dart';

class ScreenModel extends ChangeNotifier {
  int _currentIndex = 0;
  Poll _pollData;
  final List<Widget> screens = [
    HomeBody(),
    Text("Loading...."),
    AddPoll(),
    MyPolls(),
    EditPoll()
  ];

  setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  getScreen() {
    return screens[_currentIndex];
  }

  Poll getPollData() {
    return _pollData;
  }

  setPollData(Poll data) {
    _pollData = data;
    notifyListeners();
  }
}
