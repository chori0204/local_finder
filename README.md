# local_finder

A new Flutter project.

## MVVM 구조로 레이아웃 설정
 assets/
 ├──  config
        └── setting.env # api key, url 
lib/
├── app.dart                # 앱 전체 설정 및 라우팅
├── main.dart               # 앱 진입점
├── core/                   # 공통 유틸, 상수, 테마 등
│   ├── constants/
│   │   └── app_colors.dart
│   ├── utils/
│   │   └── utils.dart
│   └── theme/
│       └── app_theme.dart
├── data/                   # 데이터 소스, 모델, repository
│   ├── models/
│   │   └── finder.dart
│   ├── datasources/
│   │   └── finder_datasource.dart
│   └── repositories/
│       └── finder_repository.dart
├── features/               # 도메인(기능)별 폴더
│   └── user/
│       ├── view/           # View: 화면(UI) 위젯
│       │   └── finder_page.dart
│       ├── viewmodel/      # ViewModel: 상태 관리, 비즈니스 로직
│       │   └── finder_viewmodel.dart
│       └── widgets/        # (선택) 해당 도메인에서만 쓰는 위젯
│           └── finder_card.dart
├── services/               # 외부 서비스(API, DB 등)
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


