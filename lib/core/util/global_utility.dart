// ignore_for_file: avoid_print

import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Color colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}

int randomNumber() {
  Random random = Random();
  return random.nextInt(1000);
}

int uuid() {
  int date = DateTime.now().millisecondsSinceEpoch;
  return date;
}

void printWarning(String text) {
  print('\x1B[33m$text\x1B[0m');
}

void printError(String text) {
  print('\x1B[31m$text\x1B[0m');
}

String formatTime(double time) {
  Duration duration = Duration(milliseconds: time.round());
  return [duration.inHours, duration.inMinutes, duration.inSeconds]
      .map((seg) => seg.remainder(60).toString().padLeft(2, '0'))
      .join(':');
}
