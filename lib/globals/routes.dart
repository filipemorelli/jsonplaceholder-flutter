import 'package:flutter/material.dart';
import 'package:jsonplaceholder/pages/404/not_found_screen.dart';
import 'package:jsonplaceholder/pages/users/users_screen.dart';

Route<dynamic> onGeneratedRoutes(RouteSettings settings) {
  switch (settings.name) {
    case "users":
      return MaterialPageRoute(
          builder: (_) => UsersScreen(), settings: settings);
      break;
    default:
      return MaterialPageRoute(
          builder: (_) => NotFoundScreen(), settings: settings);
  }
}
