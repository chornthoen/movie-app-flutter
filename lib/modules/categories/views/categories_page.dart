import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/modules/categories/models/model_category.dart';
import 'package:movie_app/modules/categories/widgets/grid_category.dart';
import 'package:movie_app/modules/main/widgets/banner_widget.dart';
import 'package:movie_app/modules/movies/view/movie_all_page.dart';
import 'package:movie_app/shared/colors/app_color.dart';
import 'package:movie_app/shared/colors/app_theme.dart';
import 'package:movie_app/shared/spacing/app_spacing.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  static const routePath = '/categories_page';

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        flexibleSpace: ClipRect(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(),
            ),
          ),
        ),
        centerTitle: false,
        title: Text(
          'Categories'.toUpperCase(),
          style: context.textTheme.titleMedium!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(16),
            child: FrostedWidget(
              height: 40,
              width: 40,
              color: Colors.deepPurple.withOpacity(0.6),
              padding: const EdgeInsets.all(8),
              child: const Icon(
                PhosphorIconsRegular.magnifyingGlass,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              itemCount: categories.length,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return GridCategory(
                  image: categories[index].image,
                  title: categories[index].title,
                  onPressed: () {
                    context.push(
                      MovieAllPage.routePath,
                    );
                  },
                );
              },
            ),
            const SizedBox(height: AppSpacing.xxxlg * 2),
          ],
        ),
      ),
    );
  }
}
