import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code/core/shared_component/custom_theme.dart';
import 'package:qr_code/features/auth/presentation/bloc/authenticate_bloc.dart';
import 'package:qr_code/features/auth/presentation/pages/splash_screen.dart';
import 'package:qr_code/injection_container.dart' as di;
import 'package:qr_code/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticateBloc>(
            create: (context) => di.sl<AuthenticateBloc>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qr Code Scanner',
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme(context),
      home: const SplashScreen(),
    );
  }
}
