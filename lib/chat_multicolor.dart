import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatmulticolorPage extends StatefulWidget {
  @override
  _ChatmulticolorPageState createState() => _ChatmulticolorPageState();
}

class _ChatmulticolorPageState extends State<ChatmulticolorPage> {
  var randomizer = new Random();

  ColorFiltered _chatbubble(_ismine) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
          Colors.white, _ismine ? BlendMode.values[4] : BlendMode.values[7]),
      child: Container(
        width: MediaQuery.of(context).size.width,
        alignment: _ismine ? Alignment.centerLeft : Alignment.centerRight,
        color: Colors.transparent,
        child: Container(
          width: (randomizer
                      .nextInt(MediaQuery.of(context).size.width.toInt() - 90) +
                  50)
              .toDouble(),
          height: 30,
          margin: EdgeInsets.only(top: 5, right: 10, left: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.grey.withOpacity(0.5),
          ),
        ),
      ),
    );
  }

  List<Widget> _chatmulticolorbubbles() {
    List<Widget> list = [];

    for (var i = 0; i < 100; i++) {
      if (randomizer.nextInt(2) == 1)
        list.add(_chatbubble(false));
      else
        list.add(_chatbubble(true));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        title: Text(
          'Chat Gradient Study',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.pinkAccent,
                  Colors.deepPurpleAccent,
                  Colors.lightBlue,
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              alignment: Alignment.topCenter,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                  children: _chatmulticolorbubbles(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}