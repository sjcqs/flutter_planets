import 'package:flutter/material.dart';

class TransparentAppBar extends StatelessWidget {
  final bool displayBackButton;

  TransparentAppBar({this.displayBackButton = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: displayBackButton ? BackButton(color: Colors.white) : null,
    );
  }
}
