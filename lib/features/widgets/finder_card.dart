import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/data/models/location.dart';
import '/features/view/review_page.dart'; 

class FinderCard extends StatelessWidget {
  final Location result;

  const FinderCard({super.key, required this.result});

  String removeHtmlTags(String htmlText) {
    final RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlText.replaceAll(exp, '');
  }

  String decodeHtmlEntities(String text) {
    return text
        .replaceAll('&amp;', '&')
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>')
        .replaceAll('&quot;', '"')
        .replaceAll('&#39;', "'")
        .replaceAll('&nbsp;', ' ');
  }

  String cleanText(String htmlText) {
    return decodeHtmlEntities(removeHtmlTags(htmlText));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: const Icon(Icons.place, color: Colors.red),
        title: Text(
          cleanText(result.title),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.directions_car, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Expanded(child: Text(cleanText(result.roadAddress))),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.home, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Expanded(child: Text(cleanText(result.address))),
              ],
            ),
          ],
        ),
        isThreeLine: true,
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => ReviewPage(), //(x: result.mapx, y: result.mapy),
          //   ),
          // );
          print('/list/${result.mapx}/${result.mapy}');
          context.go('/list/${result.mapx}/${result.mapy}');
        },
      ),
    );
  }
}
