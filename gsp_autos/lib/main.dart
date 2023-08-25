import 'package:flutter/material.dart';
import 'package:gsp_autos/pages/HomePageADM.dart';

void main()  => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GSP_AUTOS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
    
  }
}