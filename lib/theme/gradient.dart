import 'package:flutter/material.dart';

class AppGradients {
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Colors.orangeAccent, Colors.yellow],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [Colors.yellowAccent, Colors.orangeAccent],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient deepPurplePrimary = LinearGradient(
    colors: [Colors.orange, Colors.orangeAccent],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient deepPurpleSecondary = LinearGradient(
    colors: [Colors.deepOrangeAccent, Colors.deepOrange],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient yellowPrimary = LinearGradient(
    colors: [Colors.yellowAccent, Colors.orangeAccent],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient multideepPurpleGradient = LinearGradient(
    colors: [
      Colors.yellow,
      Colors.orangeAccent,
      Colors.deepOrangeAccent,
    ],
    stops: [0.0, 0.5, 1.0], // Defines smooth color transitions
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient multiprigrad = LinearGradient(
    colors: [
      Colors.yellowAccent,
      Colors.yellow,
      Colors.orangeAccent,
    ],
    stops: [0.0, 0.5, 1.0], // Defines smooth color transitions
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
