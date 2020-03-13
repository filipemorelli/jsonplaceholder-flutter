import 'package:flutter/material.dart';
import 'package:jsonplaceholder/pages/404/not_found_screen.dart';
import 'package:jsonplaceholder/pages/albums/albums_screen.dart';
import 'package:jsonplaceholder/pages/main/main_screen.dart';
import 'package:jsonplaceholder/pages/photos/photo_detail.dart';
import 'package:jsonplaceholder/pages/photos/photo_screen.dart';
import 'package:jsonplaceholder/pages/todos/todos_screen.dart';
import 'package:jsonplaceholder/pages/users/users_screen.dart';

Route<dynamic> onGeneratedRoutes(RouteSettings settings) {
  switch (settings.name) {
    case "users":
      return MaterialPageRoute(
          builder: (_) => UsersScreen(), settings: settings);
      break;
    case "main":
      return MaterialPageRoute(
          builder: (_) => MainScreen(), settings: settings);
      break;
    case "todos":
      return MaterialPageRoute(
          builder: (_) => TodosScreen(), settings: settings);
      break;
    case "albums":
      return MaterialPageRoute(
          builder: (_) => AlbumScreen(), settings: settings);
      break;
    case "photos":
      return MaterialPageRoute(
          builder: (_) => PhotosScreen(albumModel: settings.arguments),
          settings: settings);
      break;
    case "photo-detail":
      return MaterialPageRoute(
          builder: (_) => PhotoDetail(photoModel: settings.arguments),
          settings: settings);
      break;
    default:
      return MaterialPageRoute(
          builder: (_) => NotFoundScreen(), settings: settings);
  }
}
