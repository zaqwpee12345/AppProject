class Nodemcu_write {
  String? massage;
  String? id;
  String? tdsValue;
  String? temperatureCelsius;
  String? phValue;
  String? Date;
  String? Time;
  double? latitude; // Change type to double
  double? longtitude; // Change type to double

  Nodemcu_write({this.massage, this.id, this.tdsValue, this.temperatureCelsius, this.phValue, this.Date, this.Time, this.latitude, this.longtitude});

  Nodemcu_write.fromJson(Map<String, dynamic> json){
    massage = json['massage'];
    id = json['id'].toString();
    tdsValue = json['tdsValue'].toString();
    temperatureCelsius = json['temperatureCelsius'].toString();
    phValue = json['phValue'].toString();
    Date = json['Date'].toString();
    Time = json['Time'].toString();
    latitude = json['latitude'] != null ? double.parse(json['latitude'].toString()) : 0; 
    longtitude = json['longtitude'] != null ? double.parse(json['longtitude'].toString()) : 0; 
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['massage'] = this.massage;
    data['id'] = this.id;
    data['tdsValue'] = this.tdsValue;
    data['temperatureCelsius'] = this.temperatureCelsius;
    data['phValue'] = this.phValue;
    data['Date'] = this.Date;
    data['Time'] = this.Time;
    data['latitude'] = this.latitude;
    data['longtitude'] = this.longtitude;

    return data;
  }
}
