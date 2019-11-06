import 'package:accentor/layouts/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Accentor',
        home: MyAppHome(),
        debugShowCheckedModeBanner: false
      );
}
