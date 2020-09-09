import 'dart:math';
import 'package:flutter/foundation.dart';

class UtilFunctions {
  static double getVox({
    @required double vo,
    @required double angle,
  }) {
    return vo * cos(angle);
  }

  static double getX({
    @required double vox,
    @required double t,
  }) {
    return vox * t;
  }

  static double getVoy({
    @required double vo,
    @required double angle,
  }) {
    return vo * sin(angle);
  }

  static double getVfy({
    @required double voy,
    @required double a,
    @required double t,
  }) {
    return voy + a * t;
  }

  static double getY({
    @required double voy,
    @required double t,
    @required double a,
  }) {
    return voy * t + ((a*pow(t, 2)) / 2);
  }

}
