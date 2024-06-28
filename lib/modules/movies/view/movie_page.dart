import 'dart:async';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/modules/categories/models/model_category.dart';
import 'package:movie_app/modules/categories/views/categories_page.dart';
import 'package:movie_app/modules/categories/widgets/item_category.dart';
import 'package:movie_app/modules/main/model/model_movie.dart';
import 'package:movie_app/modules/main/widgets/banner_widget.dart';
import 'package:movie_app/modules/main/widgets/full_screen_dialog.dart';
import 'package:movie_app/modules/movies/view/movie_all_page.dart';
import 'package:movie_app/modules/movies/view/movie_detail_page.dart';
import 'package:movie_app/modules/movies/widgets/list_movie.dart';
import 'package:movie_app/shared/colors/app_color.dart';
import 'package:movie_app/shared/colors/app_theme.dart';
import 'package:movie_app/shared/spacing/app_spacing.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController scrollController;
  late PageController _pageController;
  Color appBarColor = Colors.transparent;
  int current = 0;
  int blur = 2;

  void scrollListener() {
    if (scrollController.offset > 50) {
      setState(() {
        appBarColor = Colors.black.withOpacity(0.5);
        blur = 10;
      });
    } else {
      setState(() {
        appBarColor = Colors.transparent;
        blur = 2;
      });
    }
  }

  @override
  void initState() {
    scrollController = ScrollController();
    _pageController = PageController();
    scrollController.addListener(scrollListener);
    dateTime();
    super.initState();
  }

  late Timer timer;

  String text = '';

  String dateTime() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final current = DateTime.now();
      if (current.hour >= 0 && current.hour < 12) {
        text = 'Good\nMORNING 🌅';
      } else if (current.hour >= 12 && current.hour < 16) {
        text = 'Good\nAFTERNOON 🌞';
      } else {
        text = 'Good\nEVENING 🌙';
      }
      DateFormat('hh:mm a').format(current);
      setState(() {});
    });
    return text;
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 80,
        flexibleSpace: ClipRect(
          child: Container(
            decoration: BoxDecoration(
              color: appBarColor,
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: blur.toDouble(),
                sigmaY: blur.toDouble(),
              ),
              child: Container(),
            ),
          ),
        ),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.kPrimaryColor.withOpacity(0.5),
                    AppColors.kBlue900.withOpacity(0.3),
                  ],
                ),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                PhosphorIconsRegular.alignLeft,
                color: Colors.white,
                size: AppSpacing.xlg + 4,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              text,
              style: context.textTheme.titleMedium!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(16),
              child: FrostedWidget(
                height: 40,
                width: 40,
                color: Colors.deepPurple.withOpacity(0.6),
                padding: const EdgeInsets.all(8),
                child: const Icon(
                  PhosphorIconsBold.magnifyingGlass,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 8),
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(16),
              child: FrostedWidget(
                height: 40,
                width: 40,
                color: Colors.deepPurple.withOpacity(0.6),
                padding: const EdgeInsets.all(8),
                child: const Icon(
                  PhosphorIconsRegular.heart,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: PageView.builder(
                controller: _pageController,
                itemCount: movieList.length,
                physics: NeverScrollableScrollPhysics(),
                onPageChanged: (index) {
                  setState(() {
                    current = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Container(
                    height: 500,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(movieList[index].image),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: FrostedWidget(
                      height: 500,
                      width: double.infinity,
                      blur: 8,
                      bottomRight: 0,
                      bottomLeft: 0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.98),
                            Colors.black.withOpacity(0.05),
                            const Color(0xFF1F1D2B).withOpacity(0.7),
                            const Color(0xFF1F1D2B).withOpacity(0.8),
                            const Color(0xFF1F1D2B).withOpacity(0.9),
                            const Color(0xFF1F1D2B),
                          ],
                        ),
                      ),
                      child: const SizedBox(),
                    ),
                  );
                },
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 130),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    'Top movies',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 1200),
                        height: 400,
                        viewportFraction: 0.75,
                        autoPlay: false,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            //delayed
                            Future.delayed(const Duration(milliseconds: 600),
                                () {
                              _pageController.jumpToPage(index);
                            });
                            // _pageController.jumpToPage(index);
                            current = index;
                          });
                        },
                      ),
                      items: List.generate(
                        movieList.length,
                        (index) {
                          return GestureDetector(
                            onTap: () {
                              context.push(MovieDetailPage.routePath,
                                  extra: movieList[index]);
                            },
                            child: Stack(
                              children: [
                                Container(
                                  height: 400,
                                  width: 260,
                                  alignment: Alignment.topRight,
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 4,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    image: DecorationImage(
                                      image:
                                          NetworkImage(movieList[index].image),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  child: FrostedWidget(
                                    height: 28,
                                    width: 60,
                                    color: Colors.white.withOpacity(0.1),
                                    bottomRight: 1,
                                    topRight: 16,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    topLeft: 1,
                                    child: Row(
                                      children: [
                                        const Icon(
                                          PhosphorIconsFill.star,
                                          color: Colors.orange,
                                          size: 20,
                                        ),
                                        Text(
                                          '4.5',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                color: Colors.orange,
                                                fontWeight: FontWeight.w700,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 20,
                                  right: 20,
                                  left: 20,
                                  child: FrostedWidget(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    blur: 3,
                                    color: Colors.white.withOpacity(0.01),
                                    height: 48,
                                    child: Text(
                                      movieList[index].title,
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                            color: Colors.white,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        movieList.length,
                        (index) => dotIndicator(index),
                      ),
                    ),
                  ],
                ),
                LabelAndAction(
                  text: 'Categories',
                  onPressed: () {
                    context.push(CategoriesPage.routePath);
                  },
                ),
                SizedBox(
                  height: 90,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return ItemCategory(
                        image: categories[index].image,
                        title: categories[index].title,
                        onPressed: () {},
                      );
                    },
                  ),
                ),
                LabelAndAction(
                  text: 'Popular',
                  onPressed: () {
                    context.push(MovieAllPage.routePath);
                  },
                ),
                SizedBox(
                  height: 280,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: movieList.length,
                    itemBuilder: (context, index) {
                      return ListMovies(
                        image: movieList[index].image,
                        title: movieList[index].title,
                        onPressed: () {
                          context.push(
                            MovieDetailPage.routePath,
                            extra: movieList[index],
                          );
                        },
                      );
                    },
                  ),
                ),
                LabelAndAction(
                  text: 'All Movies',
                  onPressed: () {
                    context.push(MovieAllPage.routePath);
                  },
                ),
                SizedBox(
                  height: 280,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: movieList.length,
                    itemBuilder: (context, index) {
                      return ListMovies(
                        image: movieList[index].image,
                        title: movieList[index].title,
                        onPressed: () {
                          context.push(
                            MovieDetailPage.routePath,
                            extra: movieList[index],
                          );
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: AppSpacing.xxxlg * 2),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget dotIndicator(int index) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      opacity: current == index ? 1 : 0.5,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        width: current == index ? 50 : 8,
        height: 6,
        margin: const EdgeInsets.symmetric(
          horizontal: 2,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          gradient: LinearGradient(
            colors: [
              const Color(0xFF2E1371),
              const Color(0xFF12CDD9),
            ],
          ),
          color: current == index
              ? Color(0xFF2E1371)
              : Colors.white.withOpacity(0.5),
        ),
        curve: Curves.easeInOut,
        child: FrostedWidget(
          height: 6,
          blur: 4,
          color: Colors.white.withOpacity(0.1),
          width: current == index ? 50 : 8,
        ),
      ),
    );
  }
}
