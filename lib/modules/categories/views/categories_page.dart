import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/modules/categories/models/model_category.dart';
import 'package:movie_app/modules/categories/widgets/grid_category.dart';
import 'package:movie_app/modules/main/widgets/banner_widget.dart';
import 'package:movie_app/modules/movies/view/movie_all_page.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  static const routePath = '/categories_page';

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  late ScrollController scrollController;
  Color appBarColor = Colors.transparent;

  void scrollListener() {
    if (scrollController.offset > 50) {
      setState(() {
        appBarColor = Colors.black.withOpacity(0.1);
      });
    } else {
      setState(() {
        appBarColor = Colors.transparent;
      });
    }
  }

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1F1D2B),
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: appBarColor,
        flexibleSpace: ClipRect(
          child: Container(
            decoration: BoxDecoration(
              color: appBarColor,
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(),
            ),
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xFF2E1371),
                width: 1,
              ),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              PhosphorIconsBold.arrowLeft,
              color: Colors.white,
            ),
          ),
        ),
        titleSpacing: 0,
        centerTitle: false,
        title: Text(
          'Categories All',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
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
        controller: scrollController,
        child: Column(
          children: [
            SizedBox(height: 140),
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
          ],
        ),
      ),
    );
  }
}
