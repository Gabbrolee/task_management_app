import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'common/constant/route.dart';
import 'common/model/user_model.dart';
import 'common/utils/constant.dart';
import 'features/auth/providers/user_provider.dart';

class TaskManagement extends ConsumerWidget {
  const TaskManagement({super.key});

  static final defaultLightColorScheme =
  ColorScheme.fromSwatch(primarySwatch: Colors.blue);

  static final defaultDarkColorScheme = ColorScheme.fromSwatch(
      brightness: Brightness.dark, primarySwatch: Colors.blue);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(userProvider.notifier).refresh();
    List<UserModel> users = ref.watch(userProvider);
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
                      useMaterial3: true),
                  themeMode: ThemeMode.dark,
                  initialRoute:
                  users.isEmpty ? Routes.onboardingScreen : Routes.homeScreen,
                  onGenerateRoute: Routes.onGenerateRoute,
                  // home: const NotificationScreen(),
                );
              });
        });
  }
}
