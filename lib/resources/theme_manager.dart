// import 'package:flutter/material.dart';
//
// import 'app_values.dart';
// import 'color_manager.dart';
// import 'font_weight_manager.dart';
// import 'styles_manager.dart';
//
// ThemeData getApplicationTheme() {
//   return ThemeData(
//     // main colors
//     primaryColor: ColorManager.primary,
//     primaryColorLight: ColorManager.lightPrimary,
//     primaryColorDark: ColorManager.darkPrimary,
//     disabledColor: ColorManager.grey1,
//     splashColor: ColorManager.lightPrimary,
//
//     // card view theme
//     cardTheme: CardTheme(
//       color: Colors.white,
//       shadowColor: ColorManager.grey,
//       elevation: AppSize.s4,
//     ),
//
//     // appbar theme
//     appBarTheme: AppBarTheme(
//       centerTitle: true,
//       color: ColorManager.primary,
//       elevation: AppSize.s4,
//       shadowColor: ColorManager.lightPrimary,
//       titleTextStyle:
//           getRegularStyle(fontSize: FontSize.s16, color: ColorManager.white),
//     ),
//
//     // button theme
//     buttonTheme: ButtonThemeData(
//       shape: const StadiumBorder(),
//       disabledColor: ColorManager.grey1,
//       buttonColor: ColorManager.primary,
//       splashColor: ColorManager.lightPrimary,
//     ),
//
//     // elevated button theme
//     elevatedButtonTheme: ElevatedButtonThemeData(
//       style: ElevatedButton.styleFrom(
//         textStyle: getRegularStyle(
//           fontSize: FontSize.s17,
//           color: ColorManager.white,
//         ),
//         backgroundColor: ColorManager.primary,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(AppSize.s12),
//         ),
//       ),
//     ),
//
//     // text theme
//     textTheme: TextTheme(
//       // don't use the styles that has numbers like headline1 , bodyText1..etc
//       // because it's duplicated
//
//       displayLarge: getSemiBoldStyle(
//         color: ColorManager.darkGrey,
//         fontSize: FontSize.s16,
//       ),
//       headlineLarge: getSemiBoldStyle(
//         color: ColorManager.darkGrey,
//         fontSize: FontSize.s16,
//       ),
//       headlineMedium: getRegularStyle(
//         color: ColorManager.darkGrey,
//         fontSize: FontSize.s14,
//       ),
//       titleMedium: getMediumStyle(
//         color: ColorManager.primary,
//         fontSize: FontSize.s16,
//       ),
//       bodyLarge: getRegularStyle(color: ColorManager.grey1),
//       bodySmall: getRegularStyle(color: ColorManager.grey),
//     ),
//
//     // input decoration theme (text form field )
//     inputDecorationTheme: InputDecorationTheme(
//       contentPadding: const EdgeInsets.all(AppPadding.p8),
//       hintStyle: getRegularStyle(
//         color: ColorManager.grey,
//         fontSize: FontSize.s14,
//       ),
//       labelStyle: getMediumStyle(
//         color: ColorManager.grey,
//         fontSize: FontSize.s14,
//       ),
//       errorStyle: getRegularStyle(color: ColorManager.error),
//       enabledBorder: OutlineInputBorder(
//         borderSide: BorderSide(
//           color: ColorManager.grey,
//           width: AppSize.s1_5,
//         ),
//         borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderSide: BorderSide(
//           color: ColorManager.primary,
//           width: AppSize.s1_5,
//         ),
//         borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
//       ),
//       errorBorder: OutlineInputBorder(
//         borderSide: BorderSide(
//           color: ColorManager.error,
//           width: AppSize.s1_5,
//         ),
//         borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
//       ),
//       focusedErrorBorder: OutlineInputBorder(
//         borderSide: BorderSide(
//           color: ColorManager.primary,
//           width: AppSize.s1_5,
//         ),
//         borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
//       ),
//     ),
//   );
// }
