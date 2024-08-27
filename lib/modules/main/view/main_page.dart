import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:movie_app/modules/categories/views/categories_page.dart';
import 'package:movie_app/modules/main/blocs/navigation_cubit.dart';
import 'package:movie_app/modules/main/widgets/banner_widget.dart';
import 'package:movie_app/modules/movies/view/movie_page.dart';
import 'package:movie_app/modules/notification/view/notification_page.dart';
import 'package:movie_app/modules/profile/view/profile_page.dart';
import 'package:movie_app/shared/colors/app_color.dart';
import 'package:movie_app/shared/spacing/app_spacing.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  static const routePath = '/';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
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
  }

  final picList = [
    'assets/images/pic_1.png',
    'assets/images/pic_2.png',
    'assets/images/pic_3.png',
    'assets/images/pic_4.png',
  ];
  int selectedIndex = 0;
  List<Widget> pageList = const [
    HomePage(),
    CategoriesPage(),
    NotificationPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final selectedIndex = context.select(
      (NavigationCubit cubit) => cubit.state.indexTab,
    );
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          IndexedStack(
            index: selectedIndex,
            children: pageList,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: FrostedWidget(
              topRight: 0,
              topLeft: 0,
              height: 70,
              blur: 4,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
              ),
              child: CustomBottom(
                selectedIndex: selectedIndex,
                onTap: (index) {
                  context.read<NavigationCubit>().changeIndex(index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomBottom extends StatelessWidget {
  const CustomBottom({
    required this.selectedIndex,
    required this.onTap,
    super.key,
  });

  final int selectedIndex;
  final ValueSetter<int> onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          bottomNavItem(
            iconFill: IconlyBold.home,
            iconRegular: IconlyLight.home,
            onPressed: () => onTap(0),
            index: 0,
          ),
          bottomNavItem(
            iconFill: IconlyBold.category,
            iconRegular: IconlyLight.category,
            onPressed: () => onTap(1),
            index: 1,
          ),
          bottomNavItem(
            iconFill: IconlyBold.notification,
            iconRegular: IconlyLight.notification,
            onPressed: () => onTap(2),
            index: 2,
          ),
          bottomNavItem(
            iconFill: IconlyBold.profile,
            iconRegular: IconlyLight.profile,
            onPressed: () => onTap(3),
            index: 3,
          ),
        ],
      ),
    );
  }

  Widget bottomNavItem({
    required VoidCallback? onPressed,
    required int index,
    required IconData iconFill,
    required IconData iconRegular,
  }) {
    return InkWell(
      onTap: onPressed,
      splashColor: Colors.transparent,
      child: Column(
        children: [
          Container(
            width: 60,
            height: AppSpacing.xs,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(AppSpacing.sm),
                bottomRight: Radius.circular(AppSpacing.sm),
              ),
              color: index == selectedIndex
                  ? AppColors.kColorB
                  : Colors.transparent,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Icon(
            index == selectedIndex ? iconFill : iconRegular,
            color: AppColors.kColorB,
            size: AppSpacing.xlg,
          ),
          const SizedBox(height: AppSpacing.lg),
        ],
      ),
    );
  }
}
