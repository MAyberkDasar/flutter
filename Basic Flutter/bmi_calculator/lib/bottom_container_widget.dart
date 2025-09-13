import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';

class BottomContainerWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonTitle;

  const BottomContainerWidget(
      {super.key, required this.buttonTitle, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: bottomContainerColour,
        margin: const EdgeInsets.only(top: 10),
        width: double.infinity,
        height: bottomContainerHeight,
        child: Center(
          child: Text(
            buttonTitle,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
