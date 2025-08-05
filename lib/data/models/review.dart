import 'package:cloud_firestore/cloud_firestore.dart';

class Review {
  final String id;
  final String content;
  final double mapX;
  final double mapY;
  final DateTime createdAt;

  Review({
    required this.id,
    required this.content,
    required this.mapX,
    required this.mapY,
    required this.createdAt,
  });

  // Firestore DocumentSnapshot → Review 객체 변환
  factory Review.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Review(
      id: doc.id,
      content: data['content'] ?? '',
      mapX: (data['mapX'] ?? 0).toDouble(),
      mapY: (data['mapY'] ?? 0).toDouble(),
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }

  // Review 객체 → Map<String, dynamic> (Firestore 저장용)
  Map<String, dynamic> toMap() {
    return {
      'content': content,
      'mapX': mapX,
      'mapY': mapY,
      'createdAt': createdAt,
    };
  }
}
