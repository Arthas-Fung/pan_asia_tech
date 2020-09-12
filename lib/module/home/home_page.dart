import 'package:flutter/material.dart';
import 'package:panasiatech/widgets/BottomTabItem.dart';

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
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[

          ],
        ),
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
//        notchedShape: CircularNotchedRectangle(),
        color: const Color(0xfffa5075),
      ),
    );
  }

}