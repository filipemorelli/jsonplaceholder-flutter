import 'package:flutter/material.dart';
import 'package:jsonplaceholder/bloc/Database.dart';
import 'package:jsonplaceholder/bloc/UserBloc.dart';
import 'package:jsonplaceholder/globals/constans.dart';
import 'package:jsonplaceholder/globals/routes.dart';
import 'package:jsonplaceholder/globals/styles.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DataBaseBloc();
  await DataBaseBloc.instance.loadDataBase();
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {

  MyApp() {
    UserBloc();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JSONPlacehilder',
      theme: mainThemData,
      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
      showSemanticsDebugger: showSemanticsDebugger,
      navigatorKey: navigatorKey,
      initialRoute: "users",
      onGenerateRoute: onGeneratedRoutes,
    );
  }
}
