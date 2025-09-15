import 'dart:math';
import 'package:flutter/material.dart';

final _rnd = Random();

Color randomColor() =>
    HSVColor.fromAHSV(1, _rnd.nextDouble() * 360, 0.55 + _rnd.nextDouble() * 0.45, 0.70).toColor();

const quotes = <String>[
  "Stay hungry, stay foolish.",
  "Ship small, ship often.",
  "Practice makes progress.",
  "Focus on the next 1% better.",
  "Little steps → big wins.",
];

String randomQuote() => quotes[_rnd.nextInt(quotes.length)];
