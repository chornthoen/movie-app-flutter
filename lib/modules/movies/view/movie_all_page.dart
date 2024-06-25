import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/modules/main/model/model_movie.dart';
import 'package:movie_app/modules/main/widgets/banner_widget.dart';
import 'package:movie_app/modules/movies/view/movie_detail_page.dart';
import 'package:movie_app/modules/movies/widgets/list_movie.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class MovieAllPage extends StatefulWidget {
  const MovieAllPage({super.key});

  static const routePath = '/movie_all_page';

  @override
  State<MovieAllPage> createState() => _MovieAllPageState();
}

class _MovieAllPageState extends State<MovieAllPage> {
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
          'All Movies',
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
            const SizedBox(height: 126),
            GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              physics: const BouncingScrollPhysics(),
              itemCount: movieList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.61,
              ),
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
          ],
        ),
      ),
    );
  }
}
