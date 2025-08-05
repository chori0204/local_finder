import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


Future<void> main() async {
  ///api 설정 정보 불러오기 
  await dotenv.load(fileName: 'assets/config/setting.env'); 
  ///Firebase 초기화 코드 넣기
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  ///river_pod
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}
