import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioClient {// 싱글턴 패턴을 사용하여 Dio 인스턴스를 관리
  static Dio getInstance() { // Dio 인스턴스를 생성하고 설정
    final baseUrl = dotenv.env['API_URL'] ?? ''; // 환경 변수에서 API URL을 가져옴
    final apiKey = dotenv.env['API_KEY'] ?? ''; // 환경 변수에서 API 키를 가져옴

    final dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
      headers: {
        'X-Naver-Client-Id': apiKey,
        // 필요 시 다른 헤더 추가
      },
    ));

    return dio;
  }
}
