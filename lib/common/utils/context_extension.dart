import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext{
  void pop<T>([T? result]) => Navigator.pop(this, result);

  Future<T?> push<T>(Widget widget, {bool fullscreenDialog = false}) async =>
      await Navigator.push<T>(
        this,
        MaterialPageRoute(
          builder: (context) => widget,
          fullscreenDialog: fullscreenDialog,
        ),
      );

  void pushReplacement(Widget widget) => Navigator.pushReplacement(
      this, MaterialPageRoute(builder: (context) => widget));

  void pushReplacementNamed(String routeName, {Object? arguments}) =>
      Navigator.pushReplacementNamed(this, routeName, arguments: arguments);


  Future<T?> pushNamed<T>(String routeName, {Object? arguments}) async =>
      await Navigator.of(this).pushNamed<T>(routeName, arguments: arguments);

  Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
      String newRouteName,
      RoutePredicate predicate, {
        Object? arguments,
      }) =>
      Navigator.of(this).pushNamedAndRemoveUntil(newRouteName, predicate,
          arguments: arguments);

}