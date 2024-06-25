import 'package:flutter/material.dart';
import 'package:movie_app/modules/main/widgets/banner_widget.dart';

class ItemCategory extends StatelessWidget {
  const ItemCategory({
    super.key, required this.image, required this.title, this.onPressed,
  });

  final String image;
  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 90,
        width: 100,
        margin: const EdgeInsets.only(
          right: 12,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFF252836),
          borderRadius: BorderRadius.circular(12),
          image:  DecorationImage(
            image: NetworkImage(
              image,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: FrostedWidget(
          height: 90,
          width: 100,
          color: Colors.black.withOpacity(0.4),
          blur: 1,
          child: Text(
            title.toUpperCase(),
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
