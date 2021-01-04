import 'package:VeloGo/presentation/home/home_page.dart';
import 'package:VeloGo/presentation/sign_in/sign_in_page.dart';
import 'package:VeloGo/presentation/splash/splash_page.dart';
import 'package:auto_route/auto_route_annotations.dart';

@MaterialAutoRouter(
    generateNavigationHelperExtension: true,
    routes: <AutoRoute>[
      MaterialRoute(page: SplashPage, initial: true),
      MaterialRoute(page: SignInPage),
      MaterialRoute(page: HomePage)
    ])
class $AppRouter {
  SignInPage signInPage;
  SplashPage splashPage;
  HomePage homePage;
}
