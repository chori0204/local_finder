import 'package:flutter/material.dart';
import '/core/contents/app_colors.dart';

/// 앱의 테마를 정의하는 클래스
/// 이 클래스는 앱의 전반적인 테마를 설정하며, 라이트 모드과 다크 모드를 지원합니다.
/// 앱의 색상, 폰트 스타일 등을 정의
/// 예를 들어, primaryColor, secondaryColor, background
class AppTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    colorScheme: ColorScheme.light(
      primary: LightAppColors.primaryColor,
      secondary: LightAppColors.secondaryColor,
    ),
    scaffoldBackgroundColor: LightAppColors.backgroundColor,
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    colorScheme: ColorScheme.dark(
      primary: DarkAppColors.primaryColor,
      secondary: DarkAppColors.secondaryColor,
    ),
    scaffoldBackgroundColor: DarkAppColors.backgroundColor,
  );
}
