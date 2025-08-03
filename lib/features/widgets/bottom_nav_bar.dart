import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavBar extends StatelessWidget {// 커스텀 하단 네비게이션 바 위젯
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString(); // 현재 라우트의 위치를 가져옴

    return BottomNavigationBar( // BottomNavigationBar 위젯을 사용하여 하단 네비게이션 바 생성    
      currentIndex: _getIndex(location),
      onTap: (index) {
        switch (index) {
          case 0:
            context.go('/');
            break;
          case 1:
            context.go('/list');
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(// 각 아이템은 BottomNavigationBarItem 위젯으로 정의
          icon: Icon(Icons.home),
          label: '홈',
        ),
        BottomNavigationBarItem( 
          icon: Icon(Icons.list),
          label: '리뷰 목록',
        ),
      ],
    );
  }

  int _getIndex(String location) { // 현재 위치에 따라 인덱스를 반환
    if (location.startsWith('/list')) return 1;   // '/list' 경로가 포함된 경우
    return 0;
  }
}
