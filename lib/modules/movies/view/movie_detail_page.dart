import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/modules/main/model/model_movie.dart';
import 'package:movie_app/modules/main/widgets/banner_widget.dart';
import 'package:movie_app/modules/main/widgets/full_screen_dialog.dart';
import 'package:movie_app/modules/movies/view/movie_all_page.dart';
import 'package:movie_app/modules/movies/widgets/action_movie.dart';
import 'package:movie_app/modules/movies/widgets/button_action.dart';
import 'package:movie_app/modules/movies/widgets/list_movie.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class MovieDetailPage extends StatefulWidget {
  const MovieDetailPage({super.key, required this.modelMovie});

  final ModelMovie modelMovie;

  static const routePath = '/movie_detail_page';

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  late ScrollController scrollController;
  Color appBarColor = Colors.transparent;

  void scrollListener() {
    if (scrollController.offset > 150) {
      setState(() {
        appBarColor = Colors.black.withOpacity(0.4);
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

  bool added = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(widget.modelMovie.image),
              fit: BoxFit.fill,
            ),
          ),
          child: FrostedWidget(
            height: double.infinity,
            width: double.infinity,
            blur: 6,
            bottomLeft: 0,
            bottomRight: 0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.8),
                  Colors.black.withOpacity(0.3),
                  Colors.black.withOpacity(0.8),
                  Colors.black.withOpacity(0.9),
                  Color(0xFF1F1D2B),
                ],
              ),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            flexibleSpace: ClipRect(
              child: Container(
                decoration: BoxDecoration(
                  color: appBarColor,
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                  ),
                ),
              ),
            ),
            leading:  GestureDetector(
              onTap: (){
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
                child: Icon(
                  PhosphorIconsBold.arrowLeft,
                  color: Colors.white,
                ),
              ),
            ),
            titleSpacing: 0,
            centerTitle: false,
            title: Text(
              widget.modelMovie.title,
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
                    PhosphorIconsRegular.heart,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
          extendBody: true,
          extendBodyBehindAppBar: true,
          body: SingleChildScrollView(
            controller: scrollController,
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 130),
                          Center(
                            child: Container(
                              height: 340,
                              width: 250,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                image: DecorationImage(
                                  image: NetworkImage(widget.modelMovie.image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            widget.modelMovie.title,
                            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Divider(
                            color:Color(0xFF2E1371),
                            thickness: 0.5,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ActionMovie(
                                text: '2024',
                                icon: PhosphorIconsRegular.calendarDots,
                              ),
                              ActionMovie(
                                text: '2h 30m',
                                icon: PhosphorIconsRegular.clock,
                              ),
                              ActionMovie(
                                text: 'Action',
                                icon: PhosphorIconsRegular.filmStrip,
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ButtonAction(
                                text: 'Play Now',
                                icon: PhosphorIconsRegular.playCircle,
                                onTap: () {},
                              ),
                              ButtonAction(
                                text: 'Add List',
                                icon: added
                                    ? PhosphorIconsFill.checkCircle
                                    : PhosphorIconsRegular.plusCircle,
                                onTap: () {
                                  setState(() {
                                    added = !added;
                                  });
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Description',
                                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0xFF2E1371),
                                          Color(0xFF130B2B),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          PhosphorIconsFill.star,
                                          color: Colors.yellow,
                                          size: 16,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          '8.8',
                                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                            color: Colors.yellow,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.',
                                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    LabelAndAction(
                      text: 'More Like This',
                      onPressed: () {
                        context.push(
                          MovieAllPage.routePath,
                        );
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
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
