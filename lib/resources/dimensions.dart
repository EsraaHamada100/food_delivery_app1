// we used (get) to get the dimensions because if you don't use it you can get
// the dimensions with media query unless you are in a statful widget


import 'package:get/get.dart';

class Dimensions{
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;
}