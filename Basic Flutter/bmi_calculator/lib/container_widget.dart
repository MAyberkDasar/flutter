import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  final Color colour;
  final Widget? containerChild;
  final VoidCallback? onPress;
  const ContainerWidget(
      {super.key, required this.colour, this.containerChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10),
        ),
        child: containerChild,
      ),
    );
  }
}
