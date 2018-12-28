import 'package:flutter/material.dart';
import 'package:planets/res/res.dart';

class CompoundIconText extends Expanded {
  CompoundIconText({
    @required String icon,
    @required String text,
    int flex = 1,
  }) : super(flex: flex, child: _contentRow(icon, text));
  static Row _contentRow(String icon, String text) => Row(children: <Widget>[
        Image.asset(icon, height: 12.0),
        Container(width: Dimens.unit1),
        Text(text, style: AppTextStyle.regularTextStyle),
      ]);
}
