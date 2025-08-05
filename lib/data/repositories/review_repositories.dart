import 'package:cloud_firestore/cloud_firestore.dart';
import '/data/models/review.dart';

class ReviewRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String collectionName = 'reviews';

  // 리뷰 저장
  Future<void> saveReview(Review review) async {
    await _firestore.collection(collectionName).add(review.toMap());
  }

  // 특정 좌표에 해당하는 리뷰 모두 불러오기
  // 여기서는 mapX, mapY가 완전히 일치하는 리뷰만 조회 (필요에 따라 범위 쿼리 가능)
  Future<List<Review>> fetchReviewsByLocation(double mapX, double mapY) async {
    final querySnapshot = await _firestore
        .collection(collectionName)
        .where('mapX', isEqualTo: mapX)
        .where('mapY', isEqualTo: mapY)
        .orderBy('createdAt', descending: true)
        .get();

    return querySnapshot.docs.map((doc) => Review.fromDocument(doc)).toList();
  }
}
