import 'package:flutter/material.dart';

import '../../../styles/text_styles.dart';
import '../../../styles/values.dart';

class Button extends StatelessWidget {
  const Button({super.key,
    required this.text,
    required this.color,
    required this.onTap,
    required this.width,
    this.outline= false,
    this.disabled = false,
    this.focus = false
  });


  final String text;
  final Color color;
  final Function onTap;
  final double width;
  final bool outline;
  final bool disabled;

  /// Give the button more attension
  final bool focus;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100.0),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: Values.durationMs),
        opacity: disabled ? Values.disabledOpacity : 1.0,
        child: Container(
          width: width,
          padding: EdgeInsets.symmetric(
            horizontal: Values.buttonHorizontalPadding,
            vertical: Values.buttonVerticalPadding,
          ),
          decoration: BoxDecoration(
            // check if it's an outline button first (because it'll have no color then)
            // if not outline, check if a color has been provided
            // if not, just give the accent color
            color: outline ? Colors.transparent : color,
            borderRadius: BorderRadius.circular(Values.borderRadius),
            // putting border for regular buttons so that they are the same width and height as
            // outline buttons
            border: Border.all(
              color: outline ? color : Colors.transparent.withOpacity(0.1),
              width: 4.0,
            ),
          ),
          child: outline ? Text(
            text,
            textAlign: TextAlign.center,
            style: focus ?  TextStyle(
              fontWeight: FontWeight.w700,
              letterSpacing: 0.8,
              fontSize: 1.7 * Values.em,
              color: Colors.white60,
            ): TextStyle(
              fontWeight: FontWeight.w700,
              letterSpacing: 0.8,
              fontSize: Values.em,
              color: color,
            ),
          ): Text(
            text,
            textAlign: TextAlign.center,
            style: focus ?  TextStyle(
              fontWeight: FontWeight.w700,
              letterSpacing: 0.8,
              fontSize: 1.7 * Values.em,
              color: Colors.white60,
            ): TextStyle(
              fontWeight: FontWeight.w700,
              letterSpacing: 0.8,
              fontSize: Values.em,
              color: Colors.white60,
            ),
          ),
        ),
      ),
    );
  }
}

