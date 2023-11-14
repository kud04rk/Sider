import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:sider/src/constants/hive_strings.dart';


void main() async {
  var path = Directory.current.path;
  Hive.init(path);
  Hive.openBox(HiveBoxes.settings);


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SettingsProvider>(create: (_) => SettingsProvider()),
        ChangeNotifierProvider<GameProvider>(create: (_) => GameProvider()),
        ChangeNotifierProvider<CardProvider>(create: (_) => CardProvider()),
        ChangeNotifierProvider<PacksProvider>(create: (_) => PacksProvider()),
        ChangeNotifierProvider<StopwatchProvider>(create: (_) => StopwatchProvider()),
      ],
      child: App(),
    );

  }
}

