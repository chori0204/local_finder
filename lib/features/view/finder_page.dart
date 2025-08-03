import 'package:flutter/material.dart';
import '/features/widgets/app_bar.dart'; // 앱바 함수 import

class FinderPage extends StatelessWidget {
  const FinderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context), // 커스텀 앱바 적용
      body: Center(
        child: Text(
          'Finder Page Content',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
