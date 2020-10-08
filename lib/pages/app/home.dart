// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:poll/models/screen.dart';
import 'package:poll/pages/app/home_body.dart';
import 'package:poll/pages/app/add_poll.dart';
import 'package:poll/pages/app/my_polls.dart';
import 'package:provider/provider.dart';

// class HomeScreen extends StatelessWidget {
//   final FirebaseUser user;

//   HomeScreen({this.user});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         padding: EdgeInsets.all(32),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               "You are Logged in succesfully",
//               style: TextStyle(color: Colors.lightBlue, fontSize: 32),
//             ),
//             SizedBox(
//               height: 16,
//             ),
//             Text(
//               "${user.phoneNumber}",
//               style: TextStyle(
//                 color: Colors.grey,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
class PollHome extends StatefulWidget {
  PollHome({Key key}) : super(key: key);

  @override
  _PollHomeState createState() => _PollHomeState();
}

class _PollHomeState extends State<PollHome> {
  final topBar = new AppBar(
    backgroundColor: new Color(0xfff8faf8),
    centerTitle: true,
    elevation: 1.0,
    leading: new Icon(Icons.poll),
    title: Text("POLLOiD"),
  );
  @override
  Widget build(BuildContext context) {
    return Consumer<ScreenModel>(
      builder: (context, screen, child) {
        return Scaffold(
            appBar: topBar,
            body: screen.getScreen(), //HomeBody(),
            bottomNavigationBar: new Container(
              color: Colors.white,
              height: 50.0,
              alignment: Alignment.center,
              child: new BottomAppBar(
                child: new Row(
                  // alignment: MainAxisAlignment.spaceAround,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    new IconButton(
                      icon: Icon(
                        Icons.home,
                      ),
                      onPressed: () {
                        setState(() {
                          screen.setIndex(0);
                        });
                      },
                    ),
                    new IconButton(
                      icon: Icon(
                        Icons.add_box,
                      ),
                      onPressed: () {
                        setState(() {
                          screen.setIndex(2);
                        });
                      },
                    ),
                    new IconButton(
                      icon: Icon(
                        Icons.account_box,
                      ),
                      onPressed: () {
                        setState(() {
                          screen.setIndex(3);
                        });
                      },
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}

// class PollHome extends StatelessWidget {
//   int currentIndex = 0;
//   final List<Widget> _children = [HomeBody(), Text("ANother")];
//   final topBar = new AppBar(
//     backgroundColor: new Color(0xfff8faf8),
//     centerTitle: true,
//     elevation: 1.0,
//     leading: new Icon(Icons.poll),
//     title: Text("POLLOiD"),
//   );

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//         appBar: topBar,
//         body: _children[currentIndex], //HomeBody(),
//         bottomNavigationBar: new Container(
//           color: Colors.white,
//           height: 50.0,
//           alignment: Alignment.center,
//           child: new BottomAppBar(
//             child: new Row(
//               // alignment: MainAxisAlignment.spaceAround,
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: <Widget>[
//                 new IconButton(
//                   icon: Icon(
//                     Icons.home,
//                   ),
//                   onPressed: () {},
//                 ),
//                 new IconButton(
//                   icon: Icon(
//                     Icons.search,
//                   ),
//                   onPressed: () {
//                     currentIndex = 1;
//                   },
//                 ),
//                 new IconButton(
//                   icon: Icon(
//                     Icons.add_box,
//                   ),
//                   onPressed: null,
//                 ),
//                 new IconButton(
//                   icon: Icon(
//                     Icons.favorite,
//                   ),
//                   onPressed: null,
//                 ),
//                 new IconButton(
//                   icon: Icon(
//                     Icons.account_box,
//                   ),
//                   onPressed: null,
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
// }
