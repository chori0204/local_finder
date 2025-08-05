import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/data/models/review.dart';
import '/data/repositories/review_repositories.dart';

final reviewRepositoryProvider = Provider<ReviewRepository>((ref) {
  return ReviewRepository();
});

// 리뷰 목록 상태 (List<Review>)
final reviewsProvider = StateNotifierProvider<ReviewsNotifier, List<Review>>((ref) {
  final repo = ref.watch(reviewRepositoryProvider);
  return ReviewsNotifier(repo);
});

class ReviewsNotifier extends StateNotifier<List<Review>> {
  final ReviewRepository repository;

  ReviewsNotifier(this.repository) : super([]);

  Future<void> loadReviews(double mapX, double mapY) async {
    final reviews = await repository.fetchReviewsByLocation(mapX, mapY);
    state = reviews;
  }

  Future<void> addReview(String content, double mapX, double mapY) async {
    final review = Review(
      id: '',
      content: content,
      mapX: mapX,
      mapY: mapY,
      createdAt: DateTime.now(),
    );

    await repository.saveReview(review);
    await loadReviews(mapX, mapY);
  }
}
