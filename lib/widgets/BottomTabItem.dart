import 'package:flutter/material.dart';

class BottomTabItem extends StatelessWidget {
  final String icon;
  final String text;

  BottomTabItem({@required this.icon, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(icon: Image(
            image: AssetImage(icon),
            width: 30,
            height: 30,)
          ),
          Text(text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12
              )
          )
        ],
      ),
    );
  }
}