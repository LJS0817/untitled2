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
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  late DatabaseMng db;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    widget.db = DatabaseMng();
    WidgetsBinding.instance.addPostFrameCallback((_){
      widget.db.init();
    });
    print("TEST1234");
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => widget.db, lazy: false,),
        ChangeNotifierProvider(create: (_) => DataMng()),
        ChangeNotifierProvider(create: (_) => AppMng()),
        ChangeNotifierProvider(create: (_) => InfoMng(_), lazy: false,),
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


// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   // final DatabaseMng db = DatabaseMng();
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => DatabaseMng(), lazy: false,),
//         ChangeNotifierProvider(create: (_) => DataMng()),
//         ChangeNotifierProvider(create: (_) => AppMng()),
//         ChangeNotifierProvider(create: (_) => InfoMng(_), lazy: false,),
//       ],
//       child: MaterialApp(
//         title: "test",
//         theme: ThemeData(fontFamily: 'text'),
//         routes: {
//           '/index' : (_) => MainScreen(),
//           '/menu' : (_) => MenuScreen(),
//           '/menu/add' : (_) => AddScreen(),
//         },
//         initialRoute: '/index',
//       ),
//     );
//   }
// }
