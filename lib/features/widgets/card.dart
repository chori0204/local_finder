import 'package:flutter/material.dart';

class FinderCard extends StatelessWidget {
  final String title;
  final String description;
  final String link;

  const FinderCard({
    required this.title,
    required this.description,
    required this.link,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(description, style: TextStyle(fontSize: 14)),
            SizedBox(height: 12),
            TextButton(
              onPressed: () {
                // 링크 열기 (예: url_launcher 사용)
              },
              child: Text('자세히 보기'),
            ),
          ],
        ),
      ),
    );
  }
}
