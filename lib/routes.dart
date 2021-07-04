import 'package:flutter/material.dart';
import 'package:qrsticker/widget/home.dart';
import 'package:qrsticker/widget/login.dart';
import 'package:qrsticker/widget/create_qr.dart';

class Routes {
  Routes._();

  //static variables
  static const String home = '/home', qr = '/qr',createQr = '/create_qr', login = '/login';

  static final routes = <String, WidgetBuilder>{
    home: (BuildContext context) => HomeScreen(),
    // qr: (BuildContext context) => QrScreen(),
    createQr: (BuildContext context) => CreateQrScreen(),
    login: (BuildContext context) => LoginScreen()
  };
}
