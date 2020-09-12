import 'package:flutter/material.dart';
import 'package:panasiatech/widgets/BottomTabItem.dart';
import 'package:panasiatech/widgets/HomeColumnItem.dart';
import 'package:panasiatech/widgets/HomeRowItem.dart';

class HomeRoute extends StatefulWidget {
  HomeRoute({ Key key }) : super(key: key);

  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      resizeToAvoidBottomInset: false,
      body: Container(
          margin: const EdgeInsets.only(left: 30, top: 70, right: 30, bottom: 0),
          color: Colors.white,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("HOME",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xfffa5075),
                    fontSize: 22,
                  ),
                ),
                SizedBox(height: 10),
                HomeColumnItem(
                  icon: "lib/assets/images/clock.png",
                  title: "Schedule",
                  content: "Easily schedule event/games then find like minded players for battle. You up for it?",
                ),
                SizedBox(height: 10),
                HomeColumnItem(
                  icon: "lib/assets/images/play.png",
                  title: "Statistics",
                  content: "All data from previous and upcoming games can be found here",
                ),
                SizedBox(height: 10),
                Text("MORE",
                  style: TextStyle(
                    color: const Color(0xff030303),
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: <Widget>[
                          HomeRowItem(
                            icon: "lib/assets/images/play.png",
                            title: "Statistics",
                            content: "Easily schedule event/games then find like minded players for battle. You up for it?",
                          ),
                          HomeRowItem(
                            icon: "lib/assets/images/play.png",
                            title: "Statistics",
                            content: "All data from previous",
                          ),
                          HomeRowItem(
                            icon: "lib/assets/images/play.png",
                            title: "Statistics",
                            content: "All data from previous and upcoming games can be found here",
                          ),
                        ]
                    )
                )
              ],
            ),
          )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () { },
        backgroundColor:  const Color(0xfffa5075),
        tooltip: 'Schedule',
        child: Image(
            image: AssetImage('lib/assets/images/schedule.png'),
            width: 30,
            height: 30),
        elevation: 2.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: BorderSide(
                color: Colors.white,
                width: 5)
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            BottomTabItem(icon: "lib/assets/images/schedule.png", text: "Statistics",),
            BottomTabItem(icon: "lib/assets/images/schedule.png", text: "Discover",),
            SizedBox(),
            BottomTabItem(icon: "lib/assets/images/schedule.png", text: "Chat",),
            BottomTabItem(icon: "lib/assets/images/schedule.png", text: "Profile",),
          ],
        ),
        color: const Color(0xfffa5075),
      ),
    );
  }

}