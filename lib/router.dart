//! Assign in main.dart file for all routes as (onGenerateRoute:RouteGenerator.generateRoute)
import 'package:flutter/material.dart';
import 'package:qr_code/core/constant/index.dart';
import 'package:qr_code/core/util/global_utility.dart';
import 'package:qr_code/features/auth/presentation/pages/login_screen.dart';
import 'package:qr_code/features/auth/presentation/pages/register_screen.dart';
import 'package:qr_code/features/auth/presentation/pages/splash_screen.dart';
import 'package:qr_code/features/dashboard/presentation/pages/dashboard_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    printWarning('${settings.name}');
    switch (settings.name) {
      //! Splash Route
      case Routes.splash:
        return _GeneratePageRoute(
          widget: const SplashScreen(),
          routeName: settings.name,
        );
      //! Login Route
      case Routes.login:
        return _GeneratePageRoute(
          widget: const LoginScreen(),
          routeName: settings.name,
        );
      //! Dashboard Route
      case Routes.dashboard:
        return _GeneratePageRoute(
          widget: const DashboardScreen(),
          routeName: settings.name,
        );
      //! Register Route
      case Routes.register:
        return _GeneratePageRoute(
          widget: const RegisterScreen(),
          routeName: settings.name,
        );
      //! Default route (Invalid Url)
      default:
        return _GeneratePageRoute(
          widget: Container(
            margin: const EdgeInsets.only(top: 10, left: 10),
            width: 100,
            child: const Center(
              child: Text(
                "Invalid url",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  fontFamily: "raleway",
                ),
              ),
            ),
          ),
          routeName: '/error',
        );
    }
  }
}

//! Widget for generating routes with screen and route name
class _GeneratePageRoute extends PageRouteBuilder {
  final Widget widget;
  final String? routeName;
  _GeneratePageRoute({required this.widget, required this.routeName})
      : super(
            settings: RouteSettings(name: routeName),
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return widget;
            },
            transitionDuration: const Duration(milliseconds: 500),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return SlideTransition(
                textDirection: TextDirection.rtl,
                position: Tween<Offset>(
                  begin: const Offset(0.1, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            });
}
