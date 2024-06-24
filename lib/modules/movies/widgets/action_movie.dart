import 'package:flutter/material.dart';

class ActionMovie extends StatelessWidget {
  const ActionMovie({
    super.key, this.text, this.icon,
  });
  final String? text;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF2E1371),
                Color(0xFF130B2B),
              ],
            ),
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 16,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          text!,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
