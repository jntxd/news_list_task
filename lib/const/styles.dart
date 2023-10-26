import 'package:flutter/material.dart';
import 'package:news_list_task/const/colors.dart';

abstract class MainStyles {
  static TextStyle kBlackColorW400(double fontSize) {
    return TextStyle(
      color: AppColors.textcolor,
      fontWeight: FontWeight.w400,
      fontSize: fontSize,
      fontFamily: 'SF Pro Display',
    );
  }

  static TextStyle kWhiteColor2W400(double fontSize) {
    return TextStyle(
      color: AppColors.newscolor,
      fontWeight: FontWeight.w400,
      fontSize: fontSize,
      fontFamily: 'SF Pro Display',
    );
  }

  static TextStyle kGreyColorW400(double fontSize) {
    return TextStyle(
      color: Colors.black.withOpacity(0.6),
      fontWeight: FontWeight.w400,
      fontSize: fontSize,
      fontFamily: 'SF Pro Display',
    );
  }
}
