import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management_app/common/utils/constant.dart';
import 'package:task_management_app/features/todo/pages/home_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final defaultLightColorScheme =
  ColorScheme.fromSwatch(primarySwatch: Colors.blue);

  static final defaultDarkColorScheme =
  ColorScheme.fromSwatch(
      brightness: Brightness.dark,
      primarySwatch: Colors.blue
  );


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: const Size(375, 825),
        minTextAdapt: true,
        builder: (context, child) {
          return DynamicColorBuilder(
            builder: (lightColorScheme, darkColorScheme) {
              return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'task management',
                  theme: ThemeData(
                      scaffoldBackgroundColor: AppConstant.kBkDark,
                     // primarySwatch: Colors.blue,
                       colorScheme: lightColorScheme ?? defaultDarkColorScheme,
                      useMaterial3: true,
                  ),
                  darkTheme: ThemeData(
                    colorScheme: darkColorScheme ?? defaultDarkColorScheme,
                    scaffoldBackgroundColor: AppConstant.kBkDark,
                    useMaterial3: true
                  ),
                  themeMode: ThemeMode.dark,
                  home: const HomePage());
            }
          );
        });
  }
}
