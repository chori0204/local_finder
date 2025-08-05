import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/features/view_model/review_viewmodel.dart';

class ReviewPage extends ConsumerStatefulWidget {
  final double mapX;
  final double mapY;

  const ReviewPage({required this.mapX, required this.mapY, super.key});
  // const ReviewPage({super.key, required String x, required String y});
  @override
  ConsumerState<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends ConsumerState<ReviewPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    // 리뷰 로드
    WidgetsBinding.instance.addPostFrameCallback((_) {
     ref.read(reviewsProvider.notifier).loadReviews(widget.mapX, widget.mapY);
    });
  }

  @override
  Widget build(BuildContext context) {
    final reviews = ref.watch(reviewsProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Reviews for Location')),
      body: Column(
        children: [
          Expanded(
            child: reviews.isEmpty
                ? Center(child: Text('No reviews yet.'))
                : ListView.builder(
                    itemCount: reviews.length,
                    itemBuilder: (context, index) {
                      final review = reviews[index];
                      return ListTile(
                        title: Text(review.content),
                        subtitle: Text(review.createdAt.toLocal().toString()),
                      );
                    },
                  ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(hintText: 'Write a review'),
                )),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () async {
                    final text = _controller.text.trim();
                    if (text.isNotEmpty) {
                      await ref.read(reviewsProvider.notifier).addReview(text, widget.mapX, widget.mapY);
                      _controller.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
