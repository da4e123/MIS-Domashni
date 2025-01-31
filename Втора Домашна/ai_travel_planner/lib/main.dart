// import 'package:ai_travel_planner/screens/login.dart';
// import 'package:flutter/material.dart';
// import 'package:ai_travel_planner/screens/SignInScreen.dart';
//
// void main() {
//   runApp(MaterialApp(
//     home: AITravelPlannerScreen(),
//   ));
// }

import 'package:ai_travel_planner/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:ai_travel_planner/screens/SignInScreen.dart';
import 'package:ai_travel_planner/screens/CreateNewAccount.dart';
import 'package:ai_travel_planner/screens/LoadingScreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false, // Го отстранува debug банерот
    initialRoute: '/', // Почетен екран
    routes: {
      '/': (context) => AITravelPlannerScreen(), // Главниот екран
      '/sign_in': (context) => SignInScreen(), // Екран за Sign In
      '/create_account': (context) => CreateAccountScreen(),

    },
  ));
}