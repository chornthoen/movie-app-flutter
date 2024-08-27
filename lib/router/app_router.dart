import 'package:go_router/go_router.dart';
import 'package:movie_app/modules/authen/views/create_password_page.dart';
import 'package:movie_app/modules/authen/views/forget_password_page.dart';
import 'package:movie_app/modules/authen/views/login_page.dart';
import 'package:movie_app/modules/authen/views/otp_page.dart';
import 'package:movie_app/modules/authen/views/register_page.dart';
import 'package:movie_app/modules/categories/views/categories_page.dart';
import 'package:movie_app/modules/main/model/model_movie.dart';
import 'package:movie_app/modules/main/view/main_page.dart';
import 'package:movie_app/modules/movies/view/movie_all_page.dart';
import 'package:movie_app/modules/movies/view/movie_detail_page.dart';
import 'package:movie_app/modules/notification/view/notification_page.dart';
import 'package:movie_app/modules/profile/view/profile_page.dart';

class AppRouter {
  AppRouter._();

  static final routerConfig = GoRouter(
    routes: [
      GoRoute(
        path: MainPage.routePath,
        builder: (context, state) => const MainPage(),
      ),
      GoRoute(
        path: MovieDetailPage.routePath,
        builder: (context, state) {
          final image = state.extra;
          return MovieDetailPage(modelMovie: image! as ModelMovie);
        },
      ),
      GoRoute(
        path: CategoriesPage.routePath,
        builder: (context, state) => const CategoriesPage(),
      ),
      GoRoute(
        path: MovieAllPage.routePath,
        builder: (context, state) => const MovieAllPage(),
      ),
      GoRoute(
        path: NotificationPage.routePath,
        builder: (context, state) => const NotificationPage(),
      ),
      GoRoute(
        path: ProfilePage.routePath,
        builder: (context, state) => const ProfilePage(),
      ),
      GoRoute(
        path: CreatePasswordPage.routePath,
        builder: (context, state) => const CreatePasswordPage(),
      ),
      GoRoute(
        path: ForgetPasswordPage.routePath,
        builder: (context, state) => const ForgetPasswordPage(),
      ),
      GoRoute(
        path: LoginPage.routePath,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: OtpPage.routePath,
        builder: (context, state) => const OtpPage(),
      ),
      GoRoute(
        path: RegisterPage.routePath,
        builder: (context, state) => const RegisterPage(),
      ),
    ],
  );
}
