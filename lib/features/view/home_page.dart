import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/features/widgets/app_bar.dart';  // 커스텀 앱바 import
import '/features/widgets/finder_card.dart';
import '/features/finder_provider.dart' ;

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resultAsync = ref.watch(finderResultProvider);

    return Scaffold(
      appBar: myAppBar(context, ref),
      body: resultAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('에러 발생: $e')),
        data: (results) {
          if (results.isEmpty) {
            return const Center(child: Text('검색 결과가 없습니다.'));
          }

          return ListView.builder(
            itemCount: results.length,
            itemBuilder: (context, index) {
              return FinderCard(result: results[index]);
            },
          );
        },
      ),
    );
  }
}