import 'package:VeloGo/presentation/sign_in/sign_in_page.dart';
import 'package:auto_route/auto_route_annotations.dart';

@MaterialAutoRouter(
    generateNavigationHelperExtension: true,
    routes: <AutoRoute>[MaterialRoute(page: SignInPage, initial: true)])
class $Router {
  SignInPage signInPage;
}
