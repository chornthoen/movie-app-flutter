import 'dart:math';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/modules/main/model/model_movie.dart';
import 'package:movie_app/modules/movies/view/movie_view.dart';
import 'package:movie_app/modules/main/widgets/banner_widget.dart';
import 'package:movie_app/modules/main/widgets/drawer_widget.dart';

import 'package:movie_app/modules/main/widgets/item_profile.dart';
import 'package:movie_app/modules/movies/view/movie_detail_page.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  static const routePath = '/';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  late double _maxSlide;
  late double _extraHeight;
  late double _startingPos;
  bool _drawerVisible = false;
  late AnimationController _animationController;
  late Size _screen;
  late CurvedAnimation _animator;
  late CurvedAnimation _objAnimator;
  late PageController _pageController;
  late ScrollController scrollController;
  Color appBarColor = Colors.transparent;

  void scrollListener() {
    if (scrollController.offset > 50) {
      setState(() {
        appBarColor = Colors.black.withOpacity(0.6);
      });
    } else {
      setState(() {
        appBarColor = Colors.transparent;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(scrollListener);
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animator = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOutQuad,
      reverseCurve: Curves.easeInQuad,
    );
    _objAnimator = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
      reverseCurve: Curves.easeIn,
    );
    _pageController = PageController();
  }

  final picList = [
    'assets/images/pic_1.png',
    'assets/images/pic_2.png',
    'assets/images/pic_3.png',
    'assets/images/pic_4.png',
  ];
  int current = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _screen = MediaQuery.of(context).size;
    _maxSlide = 0.80 * _screen.width;
    _extraHeight = 0.1 * _screen.height;
  }

  void _onDragStart(DragStartDetails details) {
    _startingPos = details.globalPosition.dx;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    final globalDelta = details.globalPosition.dx - _startingPos;
    if (globalDelta > 0) {
      final pos = globalDelta / _screen.width;
      if (_drawerVisible && pos <= 1.0) return;
      _animationController.value = pos;
    } else {
      final pos = 1 - (globalDelta.abs() / _screen.width);
      if (!_drawerVisible && pos >= 0.0) return;
      _animationController.value = pos;
    }
  }

  void _onDragEnd(DragEndDetails details) {
    if (details.velocity.pixelsPerSecond.dx.abs() > 500) {
      if (details.velocity.pixelsPerSecond.dx > 0) {
        _animationController.forward(from: _animationController.value);
        _drawerVisible = true;
      } else {
        _animationController.reverse(from: _animationController.value);
        _drawerVisible = false;
      }
      return;
    }
    if (_animationController.value > 0.5) {
      _animationController.forward(from: _animationController.value);
      _drawerVisible = true;
    } else {
      _animationController.reverse(from: _animationController.value);
      _drawerVisible = false;
    }
  }

  void _toggleDrawer() {
    if (_animationController.value < 0.5) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: _onDragStart,
      onHorizontalDragUpdate: _onDragUpdate,
      onHorizontalDragEnd: _onDragEnd,
      child: Scaffold(
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() => Stack(
        children: [
          GestureDetector(
            onTap: _toggleDrawer,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF2E1371),
                      Color(0xFF130B2B),
                    ],
                  ),
                ),
              ),
            ),
          ),
          _buildBackground(),
          _buildDrawer(),
          _buildBodys(),
        ],
      );

  Widget _buildBackground() => AnimatedBuilder(
        animation: _animator,
        builder: (context, child) => Transform.translate(
          offset: Offset(_maxSlide * _animator.value, 0),
          child: Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY((pi / 2 + 0.1) * -_animator.value),
            alignment: Alignment.centerLeft,
            child: child,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(40),
          decoration: const BoxDecoration(
            color: Color(0xFF1F1D2B),
          ),
          child: Column(
            children: [
              AnimatedBuilder(
                animation: _animator,
                builder: (_, __) => Container(
                  color: Colors.black.withAlpha(
                    (150 * _animator.value).floor(),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget _buildDrawer() => AnimatedBuilder(
        animation: _animator,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(_maxSlide * (_animator.value - 1), 0),
            child: Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(pi * (1 - _animator.value) / 2),
              alignment: Alignment.centerRight,
              child: child,
            ),
          );
        },
        child: DrawerWidget(
          maxSlide: _maxSlide,
          animator: _animator,
        ),
      );

  Widget _buildBodys() => AnimatedBuilder(
        animation: _animator,
        builder: (_, child) => Opacity(
          opacity: 1 - _animator.value,
          child: Transform.translate(
            offset: Offset((_maxSlide + 50) * _animator.value, 0),
            child: Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY((pi / 2 + 0.1) * -_animator.value),
              alignment: Alignment.centerLeft,
              child: child,
            ),
          ),
        ),
        child: MovieView(
          onTap: _toggleDrawer,
        ),
      );
}
