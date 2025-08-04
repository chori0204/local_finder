

import 'package:flutter/material.dart';// Flutter 패키지 임포트
import 'package:flutter_riverpod/flutter_riverpod.dart'; // 상태 관리를 위해 Riverpod 사용
import 'package:go_router/go_router.dart'; // 라우팅을 위해 GoRouter 사용
import 'core/routes/app_routes.dart'; //  앱 라우터 설정 
import 'core/theme/app_theme.dart'; // 앱 테마 정의
import 'features/widgets/bottom_nav_bar.dart'; // 커스텀 하단 네비게이션 바 위젯


import 'features/view/home_page.dart';  // main page 
import 'features/view/finder_review_list.dart'; // 리스트 조회 페이지
import 'features/view/finder_review_editor.dart'; // 글쓰거나, 수정하는 페이지
import 'features/view/finder_review_detail.dart'; // 조회된 리스트의 상세 내용 조회 

// lib/app.dart
// 앱의 UI, 라우팅, 테마 등을 정의하는 실제 앱 구성 파일
// 이 파일은 Flutter 애플리케이션의 진입점 역할을 하며, 앱의 전반적인 구조와 기능을 설정합니다.
// 예를 들어, 앱의 테마, 라우트 설정, 상태 관리 등을 포함합니다.
// 이 파일을 통해 앱의 전반적인 레이아웃과 기능을 정의할 수 있습니다.

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return ProviderScope(
      child: MaterialApp.router(
        title: 'Local Finder',
        theme: myapp_theme.lightTheme , // 앱 테마 설정
        routerConfig: router,
      ),
    );
  }
}

/// 고정된, 라우터 설정을 생성
/// ShellRoute는 공통 레이아웃을 적용할 때 유용
/// GoRouter의 name 속성을 활용하면 context.goNamed('home')처럼 더 안전하게 라우팅
final routerProvider = Provider<GoRouter>((ref) { ///Riverpod을 활용하여 라우터도 Provider
  return GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
          body: child,
          bottomNavigationBar: const BottomNavBar(), // 커스텀 바
        );
      },
      routes: [
        GoRoute(
          path: '/',
          name: MyAppRoutes.finderPage,
          builder: (context, state) => const HomePage(),/// 조회 페이지
        ),
        GoRoute(
          path:  MyAppRoutes.listPage,
          name:  MyAppRoutes.listPage,
          builder: (context, state) => const FinderReviewList(),/// 리뷰 리스트 페이지
        ), 
        GoRoute(
          path: MyAppRoutes.detailPage,
          name: MyAppRoutes.detailPage,
          builder: (context, state) => const FinderReviewDetail(),/// 리뷰 상세내용 페이지
        ),
        GoRoute(
          path: MyAppRoutes.writePage,
          name: MyAppRoutes.writePage,
          builder: (context, state) => const FinderReviewEditor(),/// 리뷰작성페이지
        ),
        GoRoute(
          path: MyAppRoutes.rewritePage,
          name: MyAppRoutes.rewritePage,
          builder: (context, state) => const FinderReviewEditor(),/// 리뷰수정페이지
        ),
      ],
    ),   
  ],
);
});