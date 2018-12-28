import 'package:flutter/material.dart';
import 'package:planets/res/res.dart';

class Separator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimens.unit1),
      width: 18.0,
      height: 2.0,
      color: AppColors.brightTurquoise,
    );
  }
}
