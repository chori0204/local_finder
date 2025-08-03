import 'package:flutter/material.dart';
import '/core/contents/app_colors.dart';


/// 앱의 테마를 정의하는 클래스
/// 이 클래스는 앱의 전반적인 테마를 설정하며, 라이트 모드과 다크 모드를 지원합니다.
/// 앱의 색상, 폰트 스타일 등을 정의
/// 예를 들어, primaryColor, secondaryColor, background
// ignore: camel_case_types
class myapp_theme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    colorScheme: ColorScheme.light(
      primary: const Color.fromARGB(255, 71, 111, 111),
      secondary: const Color.fromARGB(189, 0, 166, 116),
    ),
    scaffoldBackgroundColor: LightAppColors.backgroundColor,
    textTheme: ThemeData.light().textTheme.copyWith(
      bodyLarge: TextStyle(color: const Color.fromARGB(255, 82, 82, 82)),
      bodyMedium: TextStyle(color: const Color.fromARGB(255, 91, 67, 67)),
    ), 
     appBarTheme: AppBarTheme(
      backgroundColor: const Color.fromARGB(131, 85, 164, 132),
      foregroundColor: const Color.fromARGB(255, 58, 55, 55),
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: LightAppColors.buttonColor,
        foregroundColor: LightAppColors.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    colorScheme: ColorScheme.dark(
      primary: DarkAppColors.primaryColor,
      secondary: DarkAppColors.secondaryColor,
    ),
    scaffoldBackgroundColor: const Color.fromARGB(255, 34, 32, 32),
    textTheme: ThemeData.dark().textTheme.copyWith(
      bodyLarge: TextStyle(color: const Color.fromARGB(255, 150, 143, 143)),
      bodyMedium: TextStyle(color: const Color.fromARGB(255, 97, 93, 93)),
    ), 
     appBarTheme: AppBarTheme(
      backgroundColor: const Color.fromARGB(255, 63, 54, 84),
      foregroundColor: const Color.fromARGB(255, 132, 113, 113),
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 126, 151, 148),
        foregroundColor: const Color.fromARGB(255, 175, 131, 131),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  );

}
