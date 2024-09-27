import 'package:flutter/material.dart';
import 'package:untitled2/AddScreen/AddScreen.dart';
import 'package:untitled2/MainScreen/MainScreen.dart';
import 'package:untitled2/MenuScreen/MenuScreen.dart';
import 'package:untitled2/Mng/DataMng.dart';
import 'package:untitled2/Mng/InfoMng.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => InfoMng()),
        ChangeNotifierProvider(create: (_) => DataMng()),
      ],
      child: MaterialApp(
        title: "test",
        theme: ThemeData(fontFamily: 'text'),
        routes: {
          '/index' : (context) => MainScreen(),
          '/menu' : (context) => MenuScreen(),
          '/menu/add' : (context) => AddScreen(),
        },
        initialRoute: '/index',
      ),
    );
  }
}
