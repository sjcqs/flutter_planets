import 'package:flutter/material.dart';
import 'package:planets/res/strings.dart';
import 'package:planets/ui/home/gradient_app_bar.dart';
import 'package:planets/ui/home/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          GradientAppBar(Strings.appName),
          HomeBody(),
        ],
      ),
    );
  }
}
