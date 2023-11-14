import 'package:flutter/material.dart';

class AppColors {
  static Color get dark => Color(0xFF333333);

  static Color get accent => Colors.indigo;
  static Color get secondary => Colors.green;
  static Color get danger => Colors.red;
  static Color get pageColor => Color(0xff222222);
  static Color get pageBorderColor => Colors.black;

  static List<Color> get blacks => [
    Color(0xff04030F),
    Color(0xff08090A),
    Color(0xff373E40),
    Color(0xff00171F),
  ];

  static List<Color> get blues => [
    Color(0xff6969B3),
    Color(0xff091540),
    Color(0xff7371FC),
    Color(0xffA594F9),
    Color(0xff255C99),
  ];

  static List<Color> get greens => [
    Color(0xff407076),
    Color(0xff6ABEA7),
    Color(0xff82C09A),
  ];

  static List<Color> get reds => [
    Color(0xffB3001B),
    Color(0xffD7707F),
  ];

  static List<Color> get oranges => [
    Color(0xffB36100),
    Color(0xffEEA957),
  ];

  static Color getColor() {
    List<Color> colorsList = [
      ...blues,
      ...greens,
      ...reds,
      ...oranges,
    ];

    Color color = (colorsList..shuffle()).first;

    return color;

    // Old color picker

    /*
    Color color;
    Random random = new Random();
    int randNo = random.nextInt(2); // generate either 0 or 1

    // depending on the letter (either the 1st or 2nd letter), pick
    // a random color
    String letter = name[randNo].toLowerCase();

    switch (letter) {
      case 'a':
      case 'b':
      case 'c':
        {
          color = blues[0];
          break;
        }
      case 'd':
      case 'e':
      case 'f':
        {
          color = blues[1];
          break;
        }
      case 'g':
      case 'h':
      case 'i':
        {
          color = blues[2];
          break;
        }
      case 'j':
      case 'k':
      case 'l':
        {
          color = blues[3];
          break;
        }
      case 'o':
        {
          color = blues[4];
          break;
        }
      case 'm':
      case 'n':
      case 'p':
      case 'q':
      case 'r':
        {
          color = dark;
          break;
        }
      case 's':
        {
          color = greens[0];
          break;
        }
      case 't':
      case 'u':
      case 'v':
        {
          color = greens[1];
          break;
        }
      case 'w':
      case 'x':
      case 'y':
      case 'z':
        {
          color = greens[2];
          break;
        }
      default:
        {
          color = dark;
        }
    }
    return color;

    */
  }
}
