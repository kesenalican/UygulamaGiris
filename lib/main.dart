import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthoui/ui/views/home/exercise_tab/find_workout_plan/find_workout_plan.dart';
import 'package:healthoui/ui/views/home/exercise_tab/introduction/introduction.dart';
import 'package:healthoui/ui/views/home/exercise_tab/muscle_binding/muscle_binding.dart';

import 'package:healthoui/ui/views/home/exercise_tab/workout_plan/workout_plan.dart';

import 'ui/shared/theme.dart';
import 'ui/views/home/home_tab_view.dart';
import 'ui/views/home/physiques/pysiques_view.dart';
import 'ui/views/home/settings/profile_view.dart';
import 'ui/views/home/tips/sub/health_tips_detail_view.dart';
import 'ui/views/login/login_view.dart';
import 'ui/views/login/onboarding_view.dart';
import 'ui/views/login/phone_view.dart';
import 'ui/views/login/register_goal_view.dart';
import 'ui/views/login/register_view.dart';
import 'ui/views/login/splash_view.dart';
import 'ui/views/login/verify_phone.view.dart';
import 'ui/views/login/verify_view.dart';

void main() {
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   systemNavigationBarColor: Colors.blue, // navigation bar color
  //   statusBarColor: Colors.pink, // status bar color
  // ));
  runApp(EasyLocalization(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;
    // SystemChrome.setSystemUIOverlayStyle(
    //     SystemUiOverlayStyle(statusBarColor: Colors.white));
    return EasyLocalizationProvider(
      data: data,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          EasylocaLizationDelegate(locale: data.locale, path: 'assets/langs'),
        ],
        supportedLocales: [Locale('en', 'US'), Locale('tr', 'TR')],
        title: 'Material App',
        initialRoute: "/exerciseTab",
        locale: data.savedLocale,
        theme: healthoTheme,
        routes: {
          "/login": (context) => LoginView(),
          "/onboard": (context) => OnBoardingView(),
          "/": (context) => PhoneView(),
          "/userGoal": (context) => UserRegisterGoalView(),
          "/userRegister": (context) => UserRegisterView(),
          "/": (context) => SplashView(),
          "/verifyPhone": (context) => VerifyPhoneView(),
          "/verify": (context) => VerifyView(),
          "/phone": (context) => PhoneView(),
          "/userRegister": (context) => UserRegisterView(),
          "/hometab": (context) => HomeTabView(),
          "/profile": (context) => ProfileView(),
          "/healthTipsDetail": (context) => HealthTipsDetailView(),
          "/physiques": (context) => PysiquesView(),
          "/workout": (_) => WorkoutPlan(),

        },
      ),
    );
  }
}
