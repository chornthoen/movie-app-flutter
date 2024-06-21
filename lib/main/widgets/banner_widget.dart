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
            autoPlayAnimationDuration: const Duration(milliseconds: 1000),
            height: 288,
            viewportFraction: 0.6,
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
              return Container(
                height: 288,
                width: 240,
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
      ),
    );
  }
}
