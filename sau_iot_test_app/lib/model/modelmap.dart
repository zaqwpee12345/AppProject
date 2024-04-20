class MAP {
  String? latitude;
  String? longtitude;

  MAP({this.latitude, this.longtitude});

  MAP.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longtitude = json['longtitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longtitude'] = this.longtitude;
    return data;
  }
}