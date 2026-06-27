
import 'package:flutter/material.dart';


class AppShadows {

  AppShadows._();

  static const Color shadowColor = Color(0x0D000000); // rgba(0, 0, 0, 0.05)
  static const Color shadowColorMedium = Color(0x1A000000); // rgba(0, 0, 0, 0.1)
  static const Color shadowColorStrong = Color(0x33000000); // rgba(0, 0, 0, 0.2)
  
  static const List<BoxShadow> none = [];
  
  static const List<BoxShadow> xs = [
    BoxShadow(
      color: shadowColor,
      offset: Offset(0, 1),
      blurRadius: 2,
      spreadRadius: 0,
    ),
  ];
  
  static const List<BoxShadow> sm = [
    BoxShadow(
      color: shadowColorMedium,
      offset: Offset(0, 1),
      blurRadius: 3,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: shadowColorMedium,
      offset: Offset(0, 1),
      blurRadius: 2,
      spreadRadius: -1,
    ),
  ];
  
  static const List<BoxShadow> md = [
    BoxShadow(
      color: shadowColorMedium,
      offset: Offset(0, 4),
      blurRadius: 6,
      spreadRadius: -1,
    ),
    BoxShadow(
      color: shadowColorMedium,
      offset: Offset(0, 2),
      blurRadius: 4,
      spreadRadius: -2,
    ),
  ];
  
  static const List<BoxShadow> lg = [
    BoxShadow(
      color: shadowColorMedium,
      offset: Offset(0, 10),
      blurRadius: 15,
      spreadRadius: -3,
    ),
    BoxShadow(
      color: shadowColorMedium,
      offset: Offset(0, 4),
      blurRadius: 6,
      spreadRadius: -4,
    ),
  ];
  
  static const List<BoxShadow> xl = [
    BoxShadow(
      color: shadowColorMedium,
      offset: Offset(0, 20),
      blurRadius: 25,
      spreadRadius: -5,
    ),
    BoxShadow(
      color: shadowColorMedium,
      offset: Offset(0, 8),
      blurRadius: 10,
      spreadRadius: -6,
    ),
  ];
  
  static const List<BoxShadow> xxl = [
    BoxShadow(
      color: Color(0x40000000), // rgba(0, 0, 0, 0.25)
      offset: Offset(0, 25),
      blurRadius: 50,
      spreadRadius: -12,
    ),
  ];
  
  static const List<BoxShadow> card = sm;
  
  static const List<BoxShadow> fab = lg;
  
  static const List<BoxShadow> bottomNav = [
    BoxShadow(
      color: shadowColorMedium,
      offset: Offset(0, -1),
      blurRadius: 3,
      spreadRadius: 0,
    ),
  ];
  
  static const List<BoxShadow> modal = xl;
  
  static const List<BoxShadow> dropdown = md;
  
  static const List<BoxShadow> button = xs;
  
  static const List<BoxShadow> buttonPressed = none;
  
  static const List<BoxShadow> inputFocus = [
    BoxShadow(
      color: Color(0x1A4F46E5), // indigo with 10% opacity
      offset: Offset(0, 0),
      blurRadius: 0,
      spreadRadius: 2,
    ),
  ];
  
  static const List<BoxShadow> primaryShadow = [
    BoxShadow(
      color: Color(0x334F46E5), // indigo-600 with 20% opacity
      offset: Offset(0, 4),
      blurRadius: 12,
      spreadRadius: 0,
    ),
  ];
  

  static const List<BoxShadow> successShadow = [
    BoxShadow(
      color: Color(0x3316A34A), // green-600 with 20% opacity
      offset: Offset(0, 4),
      blurRadius: 12,
      spreadRadius: 0,
    ),
  ];
  

  static const List<BoxShadow> errorShadow = [
    BoxShadow(
      color: Color(0x33DC2626), // red-600 with 20% opacity
      offset: Offset(0, 4),
      blurRadius: 12,
      spreadRadius: 0,
    ),
  ];
  
  /// Container(
  ///   decoration: BoxDecoration(
  ///     gradient: LinearGradient(
  ///       begin: Alignment.topCenter,
  ///       end: Alignment.bottomCenter,
  ///       colors: [
  ///         Colors.black.withOpacity(0.05),
  ///         Colors.transparent,
  ///       ],
  ///       stops: [0.0, 0.02],
  ///     ),
  ///   ),
  /// )
  /// ```
}

List<BoxShadow> createShadow({
  required Color color,
  required Offset offset,
  required double blurRadius,
  double spreadRadius = 0,
}) {
  return [
    BoxShadow(
      color: color,
      offset: offset,
      blurRadius: blurRadius,
      spreadRadius: spreadRadius,
    ),
  ];
}


List<BoxShadow> createElevation(double elevation, {Color? color}) {
  return [
    BoxShadow(
      color: color ?? AppShadows.shadowColorMedium,
      offset: Offset(0, elevation / 2),
      blurRadius: elevation,
      spreadRadius: -elevation / 4,
    ),
  ];
}
