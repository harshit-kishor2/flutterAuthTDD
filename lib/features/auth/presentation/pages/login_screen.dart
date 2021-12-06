import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code/core/constant/index.dart';
import 'package:qr_code/core/shared_component/custom_button.dart';
import 'package:qr_code/core/shared_component/custom_text.dart';
import 'package:qr_code/core/shared_component/custom_toast.dart';
import 'package:qr_code/core/shared_component/widget_helper.dart';
import 'package:qr_code/core/util/global_utility.dart';
import 'package:qr_code/features/auth/presentation/bloc/authenticate_bloc.dart';
import 'package:qr_code/injection_container.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Local states
  final _formKey = GlobalKey<FormState>();
  final bool _obscureText = true;
  bool changeButton = false;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocConsumer<AuthenticateBloc, AuthenticateState>(
            listener: (context, state) {
              _handleState(context, state);
            },
            builder: (context, state) {
              return _getLoginComponent(context, state);
            },
          ),
        ),
      ),
    );
  }

// Handle Listener
  void _handleState(context, state) {
    if (state is LoginLoadedState) {
      printWarning('LoginLoadedState');
      toast("Login Successfully");
      Navigator.pushReplacementNamed(context, Routes.dashboard);
    } else if (state is AuthFailureState) {
      printWarning('LoginLoadedState2');
      setState(() {});
      changeButton = false;
      toast("Error:${state}");
    } else if (state is AuthLoadingState) {
      printWarning('LoginLoadedState3');
      toast("Loading");
    }
  }

  Container _getLoginComponent(context, state) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    var safePadding = MediaQuery.of(context).padding.top;
    return Container(
      color: Colors.white,
      width: w,
      height: h - safePadding,
      child: Column(
        children: [
          _getBox1(),
          _getBox2(),
        ],
      ),
    );
  }

  Container _getBox1() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AssetsConst.logo,
            height: 150,
            width: 150,
          ),
          getLable(
            msg: "Welcome to my contacts",
            fontSize: 20,
          ),
          getLable(
            msg: "Please login here",
            fontSize: 17,
          )
        ],
      ),
    );
  }

  Container _getBox2() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _usernameController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              validator: (v) {
                String t = v ?? '';
                return t.trim().isNotEmpty ? null : "Enter Username";
              },
              decoration: textFieldStyle(
                  labelTextStr: "Username", hintTextStr: "Enter Username"),
            ),
            getSizeBox(),
            TextFormField(
              obscureText: _obscureText,
              controller: _passwordController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              validator: (v) {
                String t = v ?? '';
                return t.trim().isNotEmpty ? null : "Enter Password";
              },
              decoration: textFieldStyle(
                  labelTextStr: "Password", hintTextStr: "Enter Password"),
            ),
            getSizeBox(),
            getAnimatedButton(
              changeButton,
              'Login',
              onButtonClick,
            ),
            getSizeBox(),
            RichText(
              text: TextSpan(children: [
                const TextSpan(
                  text: 'Need a new account? ',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                    text: 'Register',
                    style: const TextStyle(
                      color: Colors.blue,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context, Routes.register);
                      }),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  void onButtonClick() {
    if ((_formKey.currentState as FormState).validate()) {
      changeButton = true;
      setState(() {});
      context.read<AuthenticateBloc>().add(LoginButtonClicked(
          _usernameController.text, _passwordController.text));
    }
  }
}
