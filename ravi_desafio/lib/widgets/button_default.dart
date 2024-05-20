import 'package:flutter/material.dart';

import '../theme/font.dart';
import '../theme/pallete.dart';

class ButtonDefault extends StatefulWidget {
  final String text;
  final double width;
  final VoidCallback? onPressed;

  const ButtonDefault({super.key, required this.text, required this.width, this.onPressed});

  @override
  State<ButtonDefault> createState() => _ButtonDefaultState();
}

class _ButtonDefaultState extends State<ButtonDefault> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (details) {
        setState(() {
          _isPressed = false;
        });
        widget.onPressed?.call();
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      child: Container(
        width: widget.width,
        height: 54,
        decoration: BoxDecoration(
          color: _isPressed ? Pallete.darkSecondaryColor : Pallete.secondaryColor,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Center(
          child: Text(
            widget.text,
            style: const TextStyle(
              fontSize: Font.size18,
              color: Pallete.whiteColor,
              fontFamily: Font.flame,
            ),
          ),
        ),
      ),
    );
  }
}
