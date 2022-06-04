import 'package:flutter/material.dart';
import 'package:krasnodar/pages/page_first_form.dart';
import 'package:krasnodar/pages/page_start.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/firstForm",
      routes: {
        '/firstForm': (BuildContext context) => const PageFirstForm(),
        '/start': (BuildContext context) => const PageStart(),
      },
    );
  }
}
