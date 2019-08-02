import 'package:flutter/material.dart';


class MFSettingPage extends StatelessWidget {


    final String title;


    MFSettingPage({Key key, this.title}) : super(key: key);


    @override
    Widget build(BuildContext context) {

    Scaffold page = Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Container(
        margin: EdgeInsets.fromLTRB(30, kToolbarHeight + 44, 0, 0),
        color: Colors.white,
        child: Text(
          'settingContent',
          style: TextStyle(
            fontSize: 20,
            color: Color(0xFF333333),
          ),
        ),
      )
    );
    return page;
  }

}