import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/features/widgets/app_bar.dart';  // 커스텀 앱바 import

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
//-----------------------------api test start---------------
    Future<void> _onTestButtonPressed() async {
    // 예: 네이버 API 테스트 또는 로그
    debugPrint('✅ 버튼 클릭됨 - 여기에 API 요청 코드를 넣을 수 있어요');

    // 예: 나중에 네이버 API 호출 함수 연결 가능
    // await testNaverApiRequest('강남');
  }
//-----------------------------api test end---------------
  @override
  Widget build(BuildContext context) {
    final ref = this.ref;  // 상태 클래스 내부에서 ref 사용 가능

    return Scaffold(
      appBar: myAppBar(context, ref),  // ref 전달
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Finder Page Content',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _onTestButtonPressed,
              child: const Text('네이버 API 테스트'),
            ),
          ],
        ),
      ),
    );
  }
}