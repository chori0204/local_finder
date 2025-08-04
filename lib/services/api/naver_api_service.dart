import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '/data/models/location.dart'; //

Future<List<Location>> fetchNaverLocalSearch(String query) async {
  final clientId = dotenv.env['NAVER_CLIENT_ID'];
  final clientSecret = dotenv.env['NAVER_CLIENT_SECRET'];
  final apiUrl = dotenv.env['NAVER_API_URL'];

  if (clientId == null || clientSecret == null || apiUrl == null) {
    throw Exception('.env 설정이 누락되었습니다.');
  }

  final encodedQuery = Uri.encodeQueryComponent(query);
  final uri = Uri.parse('$apiUrl?query=$encodedQuery&display=10'); // 호출할때 가져오고자 하는 갯수 

  try {
    final response = await http.get(
      uri,
      headers: {
        'X-Naver-Client-Id': clientId,
        'X-Naver-Client-Secret': clientSecret,
      },
    );

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body) as Map<String, dynamic>;
      final items = jsonBody['items'] as List<dynamic>;

      return items.map((item) => Location.fromJson(item)).toList();
    } else {
      throw Exception('API 오류: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('네이버 API 요청 실패: $e');
  }
}
// ///test 용 소스 
// import 'package:http/http.dart' as http;
// import 'package:flutter_dotenv/flutter_dotenv.dart';
//
// Future<void> testNaverApiRequest(String query) async {
//   final clientId = dotenv.env['NAVER_CLIENT_ID'];
//   final clientSecret = dotenv.env['NAVER_CLIENT_SECRET'];
//   final apiUrl = dotenv.env['NAVER_API_URL'];

//   if (clientId == null || clientSecret == null || apiUrl == null) {
//     print('.env 설정이 누락되었습니다.');
//     return;
//   }

//   final encodedQuery = Uri.encodeQueryComponent(query);
//   final uri = Uri.parse('$apiUrl?query=$encodedQuery&display=5');

//   final response = await http.get(
//     uri,
//     headers: {
//       'X-Naver-Client-Id': clientId,
//       'X-Naver-Client-Secret': clientSecret,
//     },
//   );

//   if (response.statusCode == 200) {
//     print('API 요청 성공:\n${response.body}');
//   } else {
//     print('API 요청 실패: ${response.statusCode}\n${response.body}');
//   }
// }
