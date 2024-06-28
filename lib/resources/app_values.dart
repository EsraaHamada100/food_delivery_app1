/* we make it responsive by just choose the appropriate height in our device and
 that device the size that we choose over the device height to get the probational*/

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/resources/dimensions.dart';

class AppValues {
  /* we get this probational by dividing the device height over the container size
  in our case the device height is 840 and the container size we prefer is 220
  so it's 840 / 220 = 3.84 */
  static double pageView = 318.h;
  static double pageViewContainer = 218.h;
  static double pageViewDetailsContainer = 119.h;
  static EdgeInsetsGeometry appPadding = EdgeInsets.all(AppSize.s20);
}

class AppSize {
  static double s1_2 = 1.2.r;
  static double s2 = 2.r;
  static double s3 = 3.r;
  static double s5 = 5.r;
  static double s10 = 10.r;
  static double s15 = 15.r;
  static double s16 = 16.r;
  static double s20 = 20.r;
  static double s24 = 24.r;
  static double s30 = 30.r;
  static double s40 = 40.r;
  static double s50 = 50.r;
  static double s70 = 70.r;
  static double s150 = 150.r;
}

class AppHeight {
  static double h1_8 = 1.8.h;
  static double h10 = 10.h;
  static double h15 = 15.h;
  static double h20 = 20.h;
  static double h30 = 30.h;
  static double h45 = 45.h;
  static double h60 = 60.h;
  static double h80 = 80.h;
  static double h100 = 100.h;
  static double h120 = 120.h;
  static double h130 = 130.h;
  static double h300 = 300.h;
  static double h350 = 350.h;
  static double h900 = 900.h;
}

class AppWidth {
  static double w5 = 5.w;
  static double w10 = 10.w;
  static double w20 = 20.w;
  static double w45 = 45.w;
  static double w100 = 100.w;
  static double w120 = 120.w;
}


