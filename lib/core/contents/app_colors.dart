import 'package:flutter/material.dart';

//앱의 브랜드 컬러 button, icon, text 등에서 사용되는 색상 정의
// static 으로 선언하는 이유 : 앱 전역에서 클래스 생성 없이 동일한 색상을 재사용하기 위함
// const로 선언하는 이유 : 앱이 실행되는 동안 변경되지 않는 상수 값으로 사용하기 위함
// 어디서든 이렇게 사용 가능 - AppColors.primary
class LightAppColors
 {
  static const Color primaryColor = Color(0xFF6200EE);
  static const Color secondaryColor = Color(0xFF03DAC6);
  static const Color backgroundColor = Color(0xFFF5F5F5);
  static const Color textColor = Color(0xFF000000);
  static const Color errorColor = Color(0xFFB00020);
  
  // Add more colors as needed
  static const Color appBarColor = Color(0xFF6200EE);
  static const Color buttonColor = Color(0xFF03DAC6);
  static const Color cardColor = Color(0xFFFFFFFF);   

}

class DarkAppColors
 {
  static const Color primaryColor = Color(0xFFBB86FC);
  static const Color secondaryColor = Color(0xFF03DAC6);
  static const Color backgroundColor = Color(0xFF121212);
  static const Color textColor = Color(0xFFFFFFFF);
  static const Color errorColor = Color(0xFFCF6679);
  
  // Add more colors as needed
  static const Color appBarColor = Color(0xFF3700B3);
  static const Color buttonColor = Color(0xFF03DAC6);
  static const Color cardColor = Color(0xFF1F1F1F);   
}
