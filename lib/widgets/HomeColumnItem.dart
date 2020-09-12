import 'package:flutter/material.dart';

class HomeColumnItem extends StatelessWidget {
  final String icon;
  final String title;
  final String content;

  HomeColumnItem({@required this.icon, @required this.title, @required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: const Color(0xfffa5075),
        child: Container(
          height: 170,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 20, top: 20, right: 0, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 20),
                        Text(title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 12
                            )
                        ),
                        SizedBox(height: 10),
                        Text(content,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10
                            )
                        )
                      ],
                    ),
                  )
              ),
              Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 0, top: 20, right: 20, bottom: 20),
                    child: Image(image: AssetImage(icon)),
                  )
              ),
            ],
          ),
        )
    );
  }
}