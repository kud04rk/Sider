import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:sider/src/app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sider/src/constants/hive_strings.dart';
import 'package:sider/src/providers/card_provider.dart';
import 'package:sider/src/providers/game_provider.dart';
import 'package:sider/src/providers/packs_provider.dart';
import 'package:sider/src/providers/settings_provider.dart';
import 'package:sider/src/providers/stopwatch_provider.dart';


void main() async {
  await Hive.initFlutter();
  await Hive.openBox(HiveBoxes.settings);

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

