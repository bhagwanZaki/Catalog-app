import 'package:catlog_app/screens/CartPage.dart';
import 'package:catlog_app/screens/Homepage.dart';
import 'package:catlog_app/screens/Loginpage.dart';
import 'package:catlog_app/store/store.dart';
import 'package:catlog_app/utils/Routes.dart';
import 'package:catlog_app/widgets/Themes.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  setPathUrlStrategy();
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Homepage(),
      themeMode: ThemeMode.system,
      theme: Mytheme.lightTheme(context),
      darkTheme: Mytheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.homeinRoute,
      routes: {
        "/": (context) => Loginpage(),
        MyRoutes.homeinRoute: (context) => Homepage(),
        MyRoutes.loginRoute: (context) => Loginpage(),
        MyRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
}
