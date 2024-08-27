import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_app/modules/main/model/model_movie.dart';
import 'package:movie_app/modules/notification/widgets/item_notification.dart';
import 'package:movie_app/shared/colors/app_color.dart';
import 'package:movie_app/shared/colors/app_theme.dart';
import 'package:movie_app/shared/spacing/app_spacing.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  static const routePath = '/notification';

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
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
          'Notification'.toUpperCase(),
          style: context.textTheme.titleMedium!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: movieList.length,
              itemBuilder: (context, index) {
                return ItemNotification(
                  name: movieList[index].title,
                  image: movieList[index].image,
                );
              },
            ),
            const SizedBox(height: AppSpacing.xxxlg * 3),
          ],
        ),
      ),
    );
  }
}
