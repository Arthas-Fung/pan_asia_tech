import 'package:flutter/material.dart';

class HomeRowItem extends StatelessWidget {
  final String icon;
  final String title;
  final String content;

  HomeRowItem({@required this.icon, @required this.title, @required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: const Color(0xfffa5075),
        child: Container(
          width: 210,
          height: 290,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 30, top: 40, right: 30, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 12
                          )
                      ),
                      SizedBox(height: 30),
                      Expanded(
                        child: Text(content,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10
                            )
                        ),
                      ),
                      Image(image: AssetImage(icon)),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}