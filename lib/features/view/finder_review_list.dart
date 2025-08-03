import 'package:flutter/material.dart';

class FinderReviewList extends StatelessWidget{
  const FinderReviewList({super.key});
  
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  } 
}
//리스트에서 특정 리뷰를 선택하면 상세 페이지로 이동하면서 ID를 저장
// ListTile(
//   title: Text(review.title),
//   onTap: () {
//     ref.read(reviewIdProvider.notifier).state = review.id;
//     context.goNamed('detail');
//   },
// );
