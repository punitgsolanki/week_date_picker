import 'package:flutter/material.dart';

extension SizeBox on num {
  SizedBox get sizeH => SizedBox(height: toDouble());
  SizedBox get sizeW => SizedBox(width: toDouble());
}