import 'package:flutter/material.dart';

class ScreenSizeUtils {
  ScreenSizeUtils(this.context)
      : height = MediaQuery.of(context).size.height,
        width = MediaQuery.of(context).size.width;
  final BuildContext context;
  final double height;
  final double width;

  double h(double value) => height * value;
  double w(double value) => width * value;
}
