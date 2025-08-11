import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final Widget icon;

  const MenuItem({
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            icon,
            const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}