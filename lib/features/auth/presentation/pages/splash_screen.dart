import 'package:flutter/material.dart';
import 'package:qr_code/core/constant/index.dart';
import 'package:qr_code/core/shared_component/widget_helper.dart';
import 'package:qr_code/core/util/global_utility.dart';
import 'package:qr_code/core/util/shared_preference.dart';
import 'package:qr_code/injection_container.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SharedPreferenceModule sharedPreferences = sl.get();
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        getUser();
      },
    );
  }

  getUser() async {
    var u = sharedPreferences.getUserData();
    printWarning('USER $u');
    if (u.isNotEmpty) {
      Navigator.pushReplacementNamed(context, Routes.dashboard);
    } else {
      Navigator.pushReplacementNamed(context, Routes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Center(
        child: Text("Splash Screen"),
      ),
    );
  }
}
