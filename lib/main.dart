import 'package:flutter/material.dart';

import 'utils/routes/route_name.dart';
import 'utils/routes/routes.dart';
import 'utils/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData,
      initialRoute: RouteName.loginScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
