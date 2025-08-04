// lib/features/finder/finder_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/data/models/location.dart';
import '/services/api/naver_api_service.dart';
import '/core/providers/search_providers.dart';

final finderResultProvider = FutureProvider<List<Location>>((ref) async {
  final keyword = ref.watch(searchKeywordProvider);
  if (keyword.isEmpty) return [];
  return await fetchNaverLocalSearch(keyword);
});
