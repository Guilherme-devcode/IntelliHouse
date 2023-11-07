import 'dart:ui'; // Add this import for ImageFilter

import 'package:flutter/material.dart';

class SHCard extends StatelessWidget {
  const SHCard({
    Key? key,
    this.height,
    this.children = const [],
    this.childrenPadding = EdgeInsets.zero,
  }) : super(key: key);

  final double? height;
  final List<Widget> children;
  final EdgeInsets childrenPadding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, 3),
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int index = 0; index < children.length; index++) ...[
                  Padding(
                    padding: childrenPadding,
                    child: children[index],
                  ),
                  if (index < children.length - 1) const Divider(),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
