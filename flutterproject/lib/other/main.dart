
import 'package:flutter/material.dart';
import 'package:fl/modules/main/MFMainPage.dart';

void main() => runApp(MFApp());

// This widget is the root of your application.
class MFApp extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
          home: MFMainPage(title: ''),

      );
    }

}

