import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:poll/models/CRUDModel.dart';
import 'package:poll/models/pollModel.dart';
import 'package:poll/models/screen.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class EditPoll extends StatefulWidget {
  EditPoll({Key key}) : super(key: key);

  @override
  _EditPollState createState() => _EditPollState();
}

class _EditPollState extends State<EditPoll> {
  final _formKey = GlobalKey<FormState>();

  DateTime _startDateTime;
  DateTime _endDateTime;
  String _question = "";
  String _option1 = "";
  String _option2 = "";
  String _option3 = "";
  String _option4 = "";
  var uuid = Uuid();

  @override
  Widget build(BuildContext context) {
    final pollProvider = Provider.of<CRUDModel>(context);
    final _screen = Provider.of<ScreenModel>(context);
    var poll = _screen.getPollData();
    return Container(
      padding: EdgeInsets.only(left: 32, right: 32, top: 8),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Text(
                  'Create New Poll',
                  style: new TextStyle(
                      color: Colors.blueGrey[800], fontSize: 25.0),
                ),
              ),
              new Padding(padding: EdgeInsets.only(top: 50.0)),
              TextFormField(
                initialValue: poll.question,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter poll Question';
                  }
                  _question = value;
                  return null;
                },
                onChanged: (data) {
                  _question = data.toString();
                },
              ),
              SizedBox(
                height: 56,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  initialValue: poll.options[0]['title'],
                  decoration: new InputDecoration(
                    labelText: "Option 1",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'This Option is required';
                    }
                    _option1 = value;
                    return null;
                  },
                  onChanged: (value) {
                    _option1 = value;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  initialValue: poll.options[1]['title'],
                  decoration: new InputDecoration(
                    labelText: "Option 2",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'This Option is required';
                    }
                    _option2 = value;
                    return null;
                  },
                  onChanged: (value) {
                    _option2 = value;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  initialValue:
                      poll.options.length > 3 ? poll.options[2]['title'] : "",
                  decoration: new InputDecoration(
                    labelText: "Option 3",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                  validator: (value) {
                    _option3 = value;
                    return null;
                  },
                  onChanged: (value) {
                    _option3 = value;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  initialValue:
                      poll.options.length > 4 ? poll.options[3]['title'] : "",
                  decoration: new InputDecoration(
                    labelText: "Option 4",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                  validator: (value) {
                    _option4 = value;
                    return null;
                  },
                  onChanged: (value) {
                    _option4 = value;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0)),
                  onPressed: () {
                    DatePicker.showDateTimePicker(context,
                        theme: DatePickerTheme(
                          containerHeight: 210.0,
                        ),
                        showTitleActions: true,
                        minTime: DateTime(2000, 1, 1),
                        maxTime: DateTime(2022, 12, 31), onConfirm: (date) {
                      _startDateTime = date;
                      setState(() {});
                    }, currentTime: DateTime.now(), locale: LocaleType.en);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 64.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.date_range,
                                    color: Colors.blueGrey,
                                  ),
                                  Text(
                                    _startDateTime.toString(),
                                    style: TextStyle(
                                        color: Colors.blueGrey, fontSize: 16.0),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0)),
                  onPressed: () {
                    DatePicker.showDateTimePicker(context,
                        theme: DatePickerTheme(
                          containerHeight: 210.0,
                        ),
                        showTitleActions: true,
                        minTime: DateTime(2000, 1, 1),
                        maxTime: DateTime(2022, 12, 31), onConfirm: (date) {
                      _endDateTime = date;
                      setState(() {});
                    }, currentTime: DateTime.now(), locale: LocaleType.en);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 64.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.date_range,
                                    color: Colors.blueGrey,
                                  ),
                                  Text(
                                    _endDateTime.toString(),
                                    style: TextStyle(
                                        color: Colors.blueGrey, fontSize: 16.0),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  padding: EdgeInsets.all(16.0),
                  shape: StadiumBorder(),
                  color: Colors.blueGrey[800],
                  textColor: Colors.white70,
                  onPressed: () {
                    // Validate returns true if the form is valid, or false
                    // otherwise.
                    if (_formKey.currentState.validate()) {
                      List<Map<String, dynamic>> options = [];

                      if (_option1.isNotEmpty) {
                        options.add({'title': _option1, 'votes': 0});
                      }
                      if (_option2.isNotEmpty) {
                        options.add({'title': _option2, 'votes': 0});
                      }
                      if (_option3.isNotEmpty) {
                        options.add({'title': _option3, 'votes': 0});
                      }
                      if (_option4.isNotEmpty) {
                        options.add({'title': _option4, 'votes': 0});
                      }
                      // If the form is valid, display a Snackbar.
                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text('Submitting Poll')));
                      pollProvider.updatePoll(
                        Poll(
                            createdBy: poll.createdBy,
                            startDate: _startDateTime != null
                                ? _startDateTime
                                : poll.startDate,
                            endDate: _endDateTime != null
                                ? _endDateTime
                                : poll.endDate,
                            question: _question,
                            optionType: "single selection",
                            options: options,
                            voters: poll.voters),
                        poll.id,
                      );
                      _screen.setIndex(0);
                    }
                  },
                  child: Text(
                    'Submit Poll',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
