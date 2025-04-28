import 'package:flutter/material.dart';
import 'package:untitled2/AddScreen/AddScreen.dart';
import 'package:untitled2/MainScreen/MainScreen.dart';
import 'package:untitled2/MenuScreen/MenuScreen.dart';
import 'package:untitled2/Mng/AppMng.dart';
import 'package:untitled2/Mng/DataMng.dart';
import 'package:untitled2/Mng/DatabaseMng.dart';
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
        ChangeNotifierProvider(create: (_) => AppMng()),
        ChangeNotifierProvider(create: (_) => DatabaseMng()),
      ],
      child: MaterialApp(
        title: "test",
        theme: ThemeData(fontFamily: 'text'),
        routes: {
          '/index' : (_) => MainScreen(),
          '/menu' : (_) => MenuScreen(),
          '/menu/add' : (_) => AddScreen(),
        },
        initialRoute: '/index',
      ),
    );
  }
}
