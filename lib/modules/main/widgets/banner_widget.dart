import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({
    super.key,
  });

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final picList = [
    'assets/images/pic_1.png',
    'assets/images/pic_2.png',
    'assets/images/pic_1.png',
    'assets/images/pic_2.png',
  ];
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlayAnimationDuration: const Duration(milliseconds: 1200),
            height: 400,
            viewportFraction: 0.75,
            autoPlay: true,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                current = index;
              });
            },
          ),
          items: List.generate(
            picList.length,
            (index) {
              return Stack(
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
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage(picList[index]),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child:  FrostedWidget(
                      color: Colors.white.withOpacity(0.1),
                      child: Text(
                        '12-JULY-2021',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Colors.white,
                        ),
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
                      blur: 4,
                      color: Colors.white.withOpacity(0.01),
                      child: Text(
                        'Spiderman no way home is now in theaters',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      height: 48,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            picList.length,
            (index) => dotIndicator(index),
          ),
        ),
      ],
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
          color:  Colors.white.withOpacity(0.1),
          width: current == index ? 50 : 8,
        ),
      ),
    );
  }
}

class FrostedWidget extends StatelessWidget {
  const FrostedWidget({
    super.key,
    this.text,
    this.topLeft = 8,
    this.topRight = 8,
    this.bottomLeft = 8,
    this.bottomRight = 8, this.width, this.height, this.fontSize,
    this.color = Colors.white,
    this.child,
    this.blur = 2, this.padding, this.decoration,
  });

  final String? text;
  final double? topLeft;
  final double? topRight;
  final double? bottomLeft;
  final double? bottomRight;
  final double? width;
  final double? height;
  final double? fontSize;
  final Color? color;
  final Widget? child;
  final double? blur;
  final EdgeInsetsGeometry? padding;
  final Decoration? decoration;




  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:  BorderRadius.only(
        bottomLeft: Radius.circular(bottomLeft!),
        topRight: Radius.circular(topRight!),
        topLeft: Radius.circular(topLeft!),
        bottomRight: Radius.circular(bottomRight!),
      ),
      child: Container(
        width: width ?? 120,
        height: height ?? 36,
        color: Colors.transparent,
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: blur!, sigmaY: blur!),
              child: Container(),
            ),
            Container(
              padding: padding ?? const EdgeInsets.all(1),
              decoration: decoration ?? BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(bottomLeft!),
                  topRight: Radius.circular(topRight!),
                  topLeft: Radius.circular(topLeft!),
                  bottomRight: Radius.circular(bottomRight!),
                ),
                gradient: LinearGradient(
                  colors: [
                    color ?? color!.withOpacity(0.15),
                    color ?? color!.withOpacity(0.04),
                  ],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                ),
              ),
              child: Center(
                child: child ??
                    const SizedBox(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
