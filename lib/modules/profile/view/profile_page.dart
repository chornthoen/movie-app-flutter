import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_app/modules/main/widgets/banner_widget.dart';
import 'package:movie_app/shared/colors/app_color.dart';
import 'package:movie_app/shared/colors/app_theme.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  static const routePath = '/profile';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
          'Profile'.toUpperCase(),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Profile Page',
            ),
          ],
        ),
      ),
    );
  }
}
