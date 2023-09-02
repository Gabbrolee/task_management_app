import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_management_app/features/auth/pages/login_screen.dart';
import 'package:task_management_app/features/auth/pages/otp_screen.dart';
import 'package:task_management_app/features/onboarding/pages/onboarding_screen.dart';
import 'package:task_management_app/features/todo/pages/add_task_screen.dart';
import 'package:task_management_app/features/todo/pages/home_page.dart';
import 'package:task_management_app/features/todo/pages/update_task_screen.dart';

class Routes {
  static const String onboardingScreen = "onboardingScreen";
  static const String loginScreen = "loginScreen";
  static const String otpScreen = "otpScreen";
  static const String homeScreen = "homeScreen";
  static const String addTaskScreen = "addTaskScreen";
  static const String updateTaskScreen = "updateTaskScreen";

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onboardingScreen:
        return MaterialPageRoute(builder: (context) => const Onboarding());
      case loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case addTaskScreen:
        return MaterialPageRoute(builder: (context) => const AddTaskScreen());
      case otpScreen:
        final Map args = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (context) =>
                OtpScreen(smsCodeId: args['smsCodeId'], phone: args['phone']));
      // case updateTaskScreen:
      //   return MaterialPageRoute(builder: (context)=> const UpdateTaskScreen(id: id, description: description, title: title));
      default:
        return MaterialPageRoute(
          builder: (context) => errorView(settings.name),
        );
    }
  }

  static Widget errorView(String? name) {
    return Scaffold(body: Center(child: Text('404 $name View not found')));
  }
}
