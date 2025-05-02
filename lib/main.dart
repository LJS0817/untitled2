import 'package:flutter/material.dart';
import 'package:untitled2/AddScreen/AddScreen.dart';
import 'package:untitled2/MainScreen/MainScreen.dart';
import 'package:untitled2/MenuScreen/MenuScreen.dart';
import 'package:untitled2/Provider/Create/CreateInfoProvider.dart';
import 'package:untitled2/Mng/DatabaseMng.dart';
import 'package:untitled2/Mng/InfoMng.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/Provider/Create/CreateUsageProvider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // final DatabaseMng db = DatabaseMng();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DatabaseMng(), lazy: false,),
        ChangeNotifierProvider(create: (_) => InfoMng(), lazy: false,),
        ChangeNotifierProvider(create: (_) => CreateInfoProvider()),
        ChangeNotifierProvider(create: (_) => CreateUsageProvider()),
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
