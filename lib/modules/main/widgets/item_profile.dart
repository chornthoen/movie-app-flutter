import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ItemProfile extends StatelessWidget {
  const ItemProfile({
    required this.title,
    required this.icon,
    this.onPressed,
    this.trailing,
    super.key,
    this.color,
  });

  final String title;
  final IconData icon;
  final VoidCallback? onPressed;
  final Color? color;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color:  Color(0xFF2E1371),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF2E1371),
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: color ?? Colors.white,
                    ),
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 0,
      color: Color(0xFFE5E5E5),
    );
  }
}
