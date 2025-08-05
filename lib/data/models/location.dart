//Location 이라는 모델 클래스
	// "title":"<b>강남<\/b>구청",
	// 		"link":"http:\/\/www.gangnam.go.kr\/",
	// 		"category":"공공,사회기관>구청",
	// 		"description":"",
	// 		"telephone":"",
	// 		"address":"서울특별시 강남구 삼성동 16-1 강남구청",
	// 		"roadAddress":"서울특별시 강남구 학동로 426 강남구청",
	// 		"mapx":"1270475020",
	// 		"mapy":"375173050"

class Location {
  final String title;
  final String link;
  final String address;
  final String roadAddress;
  final String mapx;
  final String mapy;

  Location({
    required this.title,
    required this.link,
    required this.address,
    required this.roadAddress,
    required this.mapx,
    required this.mapy,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      title: json['title'] as String,
      link: json['link'] as String,
      address: json['address'] as String,
      roadAddress: json['roadAddress'] as String,
      mapx: json['mapx'] as String,
      mapy: json['mapy'] as String,
    );
  }


}
