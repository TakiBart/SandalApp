import 'package:flutter/material.dart';

// TODO: (Not that important) Think about these styles.

class Style {
  static final baseTextStyle = const TextStyle();
  static final smallTextStyle = commonTextStyle.copyWith(
    fontSize: 9.0,
  );
  static final commonTextStyle = baseTextStyle.copyWith(
    color: Colors.white,
    fontSize: 14.0,
    fontWeight: FontWeight.w400
  );
  static final titleTextStyle = baseTextStyle.copyWith(
    color: Colors.white,
    fontSize: 18.0,
    fontWeight: FontWeight.w600
  );
  static final headerTextStyle = baseTextStyle.copyWith(
    color: Colors.white,
    fontSize: 20.0,
    fontWeight: FontWeight.w400
  );

}