import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:poll/models/CRUDModel.dart';
import 'package:poll/models/pollModel.dart';
import 'package:provider/provider.dart';

class PollList extends StatelessWidget {
  List<dynamic> polls;

  @override
  Widget build(BuildContext context) {
    final pollProvider = Provider.of<CRUDModel>(context);
    final _user = Provider.of<FirebaseUser>(context);
    return StreamBuilder(
      stream: pollProvider.fetchPollsAsStream(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Text('...Loading');
        } else {
          polls = snapshot.data.documents
              .map((doc) => Poll.fromMap(doc.data, doc.documentID))
              .toList();

          return ListView.builder(
              itemCount: polls.length,
              itemBuilder: (context, index) {
                int totalVote = 0;
                for (var option in polls[index].options) {
                  totalVote += option['votes'];
                }
                totalVote = totalVote == 0 ? 1 : totalVote;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              new Container(
                                height: 40.0,
                                width: 40.0,
                                decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  // image: new DecorationImage(
                                  //     fit: BoxFit.fill,
                                  //     image: new NetworkImage(
                                  //         "https://pbs.twimg.com/profile_images/916384996092448768/PF1TSFOE_400x400.jpg")),
                                ),
                              ),
                              new SizedBox(
                                width: 10.0,
                              ),
                              new Text(
                                polls[index].createdBy,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          new IconButton(
                            icon: Icon(Icons.more_vert),
                            onPressed: null,
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      child: Container(
                        height: 300,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          color: Colors.blueGrey[800],
                          elevation: 2,
                          child: Column(children: <Widget>[
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    polls[index].question,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 28,
                                        color: Colors.white70),
                                  ),
                                )
                              ],
                            ),
                            Expanded(
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: polls[index].options.length,
                                itemBuilder: (BuildContext context, int ind) {
                                  return Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        16.0, 8.0, 16.0, 8.0),
                                    child: GestureDetector(
                                      onDoubleTap: () {
                                        //  var _opts = polls[index].options;
                                        if (polls[index].voters.contains(
                                            _user.phoneNumber.toString())) {
                                        } else {
                                          polls[index].options[ind]["votes"] +=
                                              1;
                                          polls[index].voters.add(
                                              _user.phoneNumber.toString());
                                        }

                                        pollProvider.updatePoll(
                                          Poll(
                                              createdBy: polls[index].createdBy,
                                              startDate: polls[index].startDate,
                                              endDate: polls[index].endDate,
                                              question: polls[index].question,
                                              optionType: "single selection",
                                              options: polls[index].options,
                                              voters: polls[index].voters),
                                          polls[index].id,
                                        );
                                      },
                                      child: new LinearPercentIndicator(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                50,
                                        animation: true,
                                        lineHeight: 32.0,
                                        animationDuration: 2500,
                                        percent: polls[index].options[ind]
                                                ['votes'] /
                                            totalVote,
                                        center: Text(
                                          Map<String, dynamic>.from(polls[index]
                                                  .options[ind])['title'] +
                                              "(" +
                                              ((polls[index].options[ind]
                                                              ['votes'] /
                                                          totalVote) *
                                                      100)
                                                  .toInt()
                                                  .toString() +
                                              "%)",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w900),
                                        ),
                                        linearStrokeCap:
                                            LinearStrokeCap.roundAll,
                                        progressColor: Colors.blueGrey[900],
                                      ),
                                    ),
                                  );
                                },
                              ),
                              // child: Column(
                              // children: <Widget>[
                              //   Container(
                              //     decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(10),
                              //       color: Colors.blueGrey[900],
                              //       boxShadow: [
                              //         BoxShadow(
                              //             color: Colors.transparent,
                              //             spreadRadius: 3),
                              //       ],
                              //     ),
                              //     height: 32,
                              //     margin: EdgeInsets.only(bottom: 8),
                              //     width: 400,
                              //     child: Center(
                              //         child: Text(
                              //       Map<String, dynamic>.from(
                              //           polls[index].options[0])['title'],
                              //       style: TextStyle(
                              //           fontSize: 18,
                              //           color: Colors.white,
                              //           fontWeight: FontWeight.w900),
                              //     )),
                              //   ),

                              // ],
                              // )
                            ),
                          ]),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: polls[index].voters.isNotEmpty
                          ? Text(
                              "Voted by " +
                                  polls[index].voters.length.toString() +
                                  " people",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          : Text("No Votes yet"),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(polls[index].endDate.toString(),
                          style: TextStyle(color: Colors.grey)),
                    )
                  ],
                );
              });
        }
      },
    );
  }
}
