import 'package:flutter/material.dart';
import 'package:local_finder/core/routes/app_routes.dart';
import '/core/theme/app_theme.dart';

PreferredSizeWidget myAppBar(BuildContext context) {
  final routeName = ModalRoute.of(context)?.settings.name ?? '';
  final appBarTheme = Theme.of(context).appBarTheme;

  switch (routeName) {
    case MyAppRoutes.finderPage:
          return AppBar(
        title: TextField(
          decoration: InputDecoration(
            filled: true,
            hintText: '동 명을 입력해주세요',
            hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(color: Colors.grey, width: 2.0),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_location),
            onPressed: () {
              debugPrint('지도에서 위치를 찾습니다.');
            },
          ),
        ],
        backgroundColor: appBarTheme.backgroundColor,
        foregroundColor: appBarTheme.foregroundColor,
        elevation: appBarTheme.elevation,
        centerTitle: appBarTheme.centerTitle,
      );
    case MyAppRoutes.listPage:
      return AppBar(
        title: TextField(
          style: Theme.of(context).textTheme.bodyLarge,
          decoration: InputDecoration(
            hintText: '동 명을 입력해주세요',
            hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(color: Colors.grey, width: 2.0),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_location),
            onPressed: () {
              debugPrint('지도에서 위치를 찾습니다.');
            },
          ),
        ],
        backgroundColor: appBarTheme.backgroundColor,
        foregroundColor: appBarTheme.foregroundColor,
        elevation: appBarTheme.elevation,
        centerTitle: appBarTheme.centerTitle,
      );

    case MyAppRoutes.detailPage:
      return AppBar(
        title: const Text('리뷰 목록'),
        leading: const Icon(Icons.person),
        backgroundColor: appBarTheme.backgroundColor,
        foregroundColor: appBarTheme.foregroundColor,
        elevation: appBarTheme.elevation,
      );

    case MyAppRoutes.writePage:
      return AppBar(
        title: const Text('글쓰기'),
        leading: const Icon(Icons.save),
        backgroundColor: appBarTheme.backgroundColor,
      );

    case MyAppRoutes.rewritePage:
      return AppBar(
        title: const Text('수정하기'),
        leading: const Icon(Icons.save),
        backgroundColor: appBarTheme.backgroundColor,
      );

    default:
      return AppBar(
        title: const Text('페이지가 없습니다.'),
        backgroundColor: Colors.redAccent,
      );
  }
}
