import 'package:flutter/material.dart';
import 'package:hashfi_task2_app/pages/routes/my_route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  // This widget is the root of your application.
  final route = MyRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/bottomNav',
      onGenerateRoute: route.onRoute,
    );
  }
}
