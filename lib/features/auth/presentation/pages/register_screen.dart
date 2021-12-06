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

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //Local states
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool changeButton = false;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
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
              return _getLoginComponent(context);
            },
          ),
        ),
      ),
    );
  }

  // Handle Listener
  void _handleState(context, state) {
    if (state is RegisterLoadedState) {
      toast("Register Successfully");
      Navigator.pushReplacementNamed(context, Routes.login);
    } else if (state is AuthFailureState) {
      setState(() {});
      changeButton = false;
      toast("Error");
    } else if (state is AuthLoadingState) {
      toast("Loading");
    }
  }

  Container _getLoginComponent(context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    var safePadding = MediaQuery.of(context).padding.top;
    return Container(
      color: Colors.white,
      width: w,
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
            msg: "Please Register here",
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
              controller: _firstnameController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              validator: (v) {
                String t = v ?? '';
                return t.trim().isNotEmpty ? null : "Enter First Name";
              },
              decoration: textFieldStyle(
                  labelTextStr: "First Name", hintTextStr: "Enter First Name"),
            ),
            getSizeBox(),
            TextFormField(
              controller: _lastnameController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              validator: (v) {
                String t = v ?? '';
                return t.trim().isNotEmpty ? null : "Enter Last Name";
              },
              decoration: textFieldStyle(
                  labelTextStr: "Last Name", hintTextStr: "Enter Last Name"),
            ),
            getSizeBox(),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              validator: (v) {
                String t = v ?? '';
                return t.trim().isNotEmpty ? null : "Enter Email";
              },
              decoration: textFieldStyle(
                  labelTextStr: "Email", hintTextStr: "Enter Email"),
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
              'Register',
              onButtonClick,
            ),
            getSizeBox(),
            RichText(
              text: TextSpan(children: [
                const TextSpan(
                  text: 'Already have account? ',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                    text: 'Login',
                    style: const TextStyle(
                      color: Colors.blue,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pop(context);
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
      context.read<AuthenticateBloc>().add(RegisterButtonClicked(
          _usernameController.text,
          _passwordController.text,
          _firstnameController.text,
          _lastnameController.text,
          _emailController.text));
    }
  }
}
