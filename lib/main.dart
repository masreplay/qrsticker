import 'package:flutter/material.dart';
import 'package:qrsticker/routes.dart';
import 'package:qrsticker/widget/home.dart';
import 'package:qrsticker/widget/login.dart';

import 'constants/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: "Strings.appName",
      theme: themeData,
      routes: Routes.routes,
      home: LoginScreen(),
    );
  }
}
