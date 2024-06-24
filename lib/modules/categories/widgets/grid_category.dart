

import 'package:flutter/material.dart';
import 'package:movie_app/modules/main/widgets/banner_widget.dart';

class GridCategory extends StatelessWidget {
  const GridCategory({
    required this.image,
    required this.title,
    super.key,
    this.onPressed,
    this.bottom = 16,
  });
  final String image;
  final String title;
  final VoidCallback? onPressed;
  final double? bottom;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 200,
        width: double.infinity,
        margin:  EdgeInsets.only(
          bottom: bottom ?? 16,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFF252836),
          borderRadius: BorderRadius.circular(12),
          image:  DecorationImage(
            image: NetworkImage(
              image,
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: FrostedWidget(
          height: 200,
          width: double.infinity,
          color: Colors.black.withOpacity(0.3),
          blur: 4,
          child: Text(
            title.toUpperCase(),
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
