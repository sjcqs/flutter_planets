import 'package:flutter/material.dart';
import 'package:planets/res/colors.dart';

class AppTextStyle {
  AppTextStyle._();

  static final baseTextStyle = const TextStyle(fontFamily: 'Poppins');
  static final regularTextStyle = baseTextStyle.copyWith(
    color: AppColors.coldPurple,
    fontSize: 9.0,
    fontWeight: FontWeight.w400,
  );
  static final subHeaderTextStyle = regularTextStyle.copyWith(fontSize: 12.0);
  static final headerTextStyle = baseTextStyle.copyWith(
    color: Colors.white,
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
  );
  static final commonTextStyle = baseTextStyle.copyWith(
    color: AppColors.coldPurple,
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
  );
  static final appBarTextStyle = baseTextStyle.copyWith(
    color: Colors.white,
    fontWeight: FontWeight.w600,
    fontSize: 36.0,
  );
}
