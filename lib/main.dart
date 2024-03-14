import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutterprovider/pages/counter/counter_provider.dart';
import 'package:flutterprovider/pages/home/home.dart';
import 'package:flutterprovider/pages/post/post_provider.dart';
import 'package:flutterprovider/pages/user/user_provider.dart';
import 'package:flutterprovider/utils/apptheme/theme_provider.dart';
import 'package:flutterprovider/utils/connectivity/connection_alert.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => PostProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider())
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      textDirection: ui.TextDirection.ltr,
      children: [
        MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Provider Demo',
          //theme: Provider.of<ThemeProvider>(context).themeData,
          theme: context.watch<ThemeProvider>().themeData,

          // theme: ThemeData(
          //     // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          //     // useMaterial3: true,
          //     appBarTheme: const AppBarTheme(
          //       elevation: 0.0,
          //     ),
          //     primarySwatch: Colors.blue),
          
          home: const Home(),
        ),
        const ConnectionAlert(),
      ],
    );


    // return MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(create: (context) => CounterProvider()),
    //     ChangeNotifierProvider(create: (context) => UserProvider()),
    //     ChangeNotifierProvider(create: (context) => PostProvider()),
    //     ChangeNotifierProvider(create: (context) => ThemeProvider())
    //   ],
    //   child: Stack(
    //     alignment: AlignmentDirectional.bottomStart,
    //     textDirection: ui.TextDirection.ltr,
    //     children: [
    //       MaterialApp(
    //         debugShowCheckedModeBanner: false,
    //         title: 'Flutter Provider Demo',
    //         theme: Provider.of<ThemeProvider>(context).themeData,
    //         //theme: context.watch<ThemeProvider>().themeData,

    //         // theme: ThemeData(
    //         //     // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //         //     // useMaterial3: true,
    //         //     appBarTheme: const AppBarTheme(
    //         //       elevation: 0.0,
    //         //     ),
    //         //     primarySwatch: Colors.blue),
            
    //         home: const Home(),
    //       ),
    //       const ConnectionAlert(),
    //     ],
    //   ),
    // );
  }
}
