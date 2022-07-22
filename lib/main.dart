// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:capstone_flutter/screen/others/template.dart';
import 'package:capstone_flutter/screen/others/welcome.dart';
import 'package:capstone_flutter/screen/view_model/register_provider.dart';
import 'package:capstone_flutter/utils/constant/preference_key.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;

import 'cubit/capt_cubit.dart';
import 'screen/view_model/login_provider.dart';
import 'screen/view_model/profile_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      BlocProvider(create: (_) => DataCubit()),
      ChangeNotifierProvider(create: (_) => ProfileProvider()),
      ChangeNotifierProvider(create: (_) => LoginProvider()),
      ChangeNotifierProvider<RegisterProvider>(
          create: (_) => RegisterProvider())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isUser = false;
  @override
  void initState() {
    super.initState();
    _initCheck();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Splash(isUser));
  }

  void _initCheck() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getBool('isUser') != null) {
      setState(() {
        isUser = prefs.getBool('isUser')!;
      });
    }
  }
}

class Splash extends StatefulWidget {
  final bool isUser;
  Splash(this.isUser);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: Duration(seconds: 2))
        ..repeat();

  Future validateUser() async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    final String? token = preference.getString(PreferenceKey.token);
    if (token != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (c) => TemplatePage(),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (c) => WelcomePage(),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      validateUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (_, child) {
            return Transform.rotate(
              angle: _controller.value * 2 * math.pi,
              child: child,
            );
          },
          child: Container(
            height: 100,
            width: 100,
            child: Image.asset("images/logofound.png"),
          ),
        ),
      ),
    );
  }
}
