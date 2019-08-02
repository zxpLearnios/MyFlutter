import 'package:flutter/material.dart';


 class MFMinePage extends StatefulWidget {

  final String title;


  MFMinePage({Key key, this.title}) : super(key: key);


  @override
  _MFMinePageState createState() => _MFMinePageState();

 }

 class _MFMinePageState extends State<MFMinePage> {

   @override
  Widget build(BuildContext context) {

     return Scaffold(
       appBar: AppBar(
         title: Text(widget.title),
         backgroundColor: Colors.blueGrey,
       ),
       body: Container (
         color: Colors.black12,
         child: Center(
           child: Text('mineContent'),
         ),
       ),
     );
  }

 }