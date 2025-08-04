import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';


Future<void> main() async {
  await dotenv.load(fileName: 'assets/config/setting.env'); 
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}
