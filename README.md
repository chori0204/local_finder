# local_finder

A new Flutter project.

## MVVM 구조로 레이아웃 설정
assets/
├──  config
    └── setting.env # api key, url 
lib/
├── app.dart                # 앱 전체 설정 및 라우팅
├── main.dart               # 앱 진입점
├──firebase_options.dart
├── core/                   # 공통 유틸, 상수, 테마 등
│   ├── constants/
│   │   └── app_colors.dart # 앱 테마별 색상 정의
│   └── theme/
│   │   └── app_theme.dart   # 앱 테마 (app_color.dart - dark,light)
│   ├── routers/
│   │   └── app_routes.dart  # 라우트 path 상수 정의    
│   ├── providers/
│   │   └── search_providers.dart
├── data/                   # 데이터 소스, 모델, repository
│   ├── models/
│   │   ├── review.dart
│   │   └── location.dart
│   └── repositories/
│       └── review_repository.dart 
├── features/               # 도메인(기능)별 폴더
│    └──  view/           # View: 화면(UI) 위젯
│    │   ├── home_page.dart #지역을 조회하는 화면,카드는 finder_card.dart 에서 선언된 디자인을 가져와 뿌려주는 형식
│    │   ├── finder_review_detail.dart # 지역리뷰를 상세하게 조회하는 화면 ,선택 삭제가능 (진행중)
│    │   ├── finder_review_editor.dart #지역리뷰를 작성,수정,삭제 하는 화면 (진행중)
│    │   └── review_page.dart # 해당건의 리뷰리스트를 보여주는 화면, 
│    ├── viewmodel/      # ViewModel: 상태 관리, 비즈니스 로직
│    │   └── location_viewmodel.dart
│    └── widgets/        # (선택) 해당 도메인에서만 쓰는 위젯
│       ├── app_bar.dart    # 앱바를 라우트 네임에 따라 선택적으로 나오도록 설정 
│       ├── bottom_navi_bar.dart #하단 네비게이션바
│       └── finder_card.dart # 지역정보 조회 하는 화면의 카드 위젯
├── services/               # 외부 서비스(API, DB 등)
│   ├──naver_api_service.dart
│   └── api_service.dart
<!-- └── shared/                 # 여러 도메인에서 공통으로 쓰는 위젯, 컴포넌트
    └── custom_button.dart -->
// core/: 앱 전역에서 사용하는 유틸, 상수, 테마 등
// data/: 모델, 데이터소스(API/DB), 레포지토리(비즈니스 로직)
// features/: 도메인(기능)별로 view/viewmodel/widgets로 분리
// services/: 외부 서비스 연동
// shared/: 여러 도메인에서 재사용하는 위젯

-------------------------
## 해야할일 
-------------------------
1. 화면구성 
    디자인 된 화면을 보고 레이아웃을 구성 할 수 있다.
    homepage 
        appbar의 title.textfield 위젯 배치
        scaffold body listview 배치
            - titel, category,roadaccress 세로 배열
2. 기능구현
    네이버 검색 open api를 이용하여 지역검색 기능을 구현
        
        1. 네이버 open api 세팅 시, 패키지 명이 필요하다 

        >**안드로이드
        경로 : android/app/build.gradle.kts**
        android {
            namespace = "com.example.~"

        >**IOS
        경로: ios/Runner.xcodeproj/project.pbxproj**
        PRODUCT_BUNDLE_IDENTIFIER = com.example.~;

    Riverpod을 이용하여, MVVM 구조로 프로젝트를 설계 할 수 있다.
    Firebase Firestore 를 이용하여 데이터를 저장 및 활용 할 수 있다.
   
    GPS를 사용하여 디바이스의 좌표값을 이용 할 수 있다.
    VWORD open api 를 이용 할 수 있다.
        계정 생성 및 api-key check 

## 추가기능
1. app_routes.dart 에 상수로 라우터 경로를 지정해둿고 
   app_bar.dart 해당하는 상수에 맞게 앱바를 가져올수있도록 처리
    bottom_navigation_bar.dart
2.main.dart에서 앱 시작 전에 .env 파일을 로드
 >flutter pub add flutter_dotenv
 

## ERR - 확인 
1.app_bar.dart: PreferredSizeWidget
>Dart에서 오류가 나는 이유는, switch문의 모든 case에서 return을 하긴 했지만 default(그 외의 경우)에 대한 반환이 없기 때문이에요. 즉, 만약 위에 정의되지 않은 경로가 들어오면 아무 것도 반환하지 않고 함수가 끝나게 되죠. 그런데 함수의 반환 타입은 PreferredSizeWidget이라 반드시 어떤 값을 반환해야 해요.

2.UpperCamelCase/lowerCamelCase
>Dart의 Effective Style Guide에 따르면, 클래스나 타입 이름은 UpperCamelCase, 
 변수나 함수 이름은 lowerCamelCase를 사용해야 가독성과 일관성

3. GoRouter에서 name은 전역적으로 고유해야 합니다. name: '/list'처럼 경로를 그대로 이름으로 쓰면, 경로가 중복될 경우 충돌이 발생

### 자료 진행방법
 Firestore 객체 가지고 오기 → 컬렉션 참조 만들기 → 문서 참조 만들기 → 읽기,수정,삭제,생성