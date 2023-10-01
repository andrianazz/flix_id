import 'package:flutter/material.dart';

Map<double, SizedBox> _verticalSpaces = {};

Map<double, SizedBox> _horizontalSpaces = {};

SizedBox verticalSpace(double height) {
  if (!_verticalSpaces.containsKey(height)) {
    final space = SizedBox(height: height);
    _verticalSpaces[height] = space;
    return space;
  }

  return _verticalSpaces[height]!;
}

SizedBox horizontalSpace(double width) {
  if (!_horizontalSpaces.containsKey(width)) {
    final space = SizedBox(width: width);
    _horizontalSpaces[width] = space;
    return space;
  }

  return _horizontalSpaces[width]!;
}
