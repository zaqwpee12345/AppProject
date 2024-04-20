class Sau {
  String? message;
  String? id;
  String? tdsValue;
  String? temperatureCelsius;
  String? Date;
  String? Time;
  //String? sauLevel;

  Sau({this.message, this.id, this.tdsValue, this.temperatureCelsius, this.Date, this.Time});

  Sau.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    id = json['id'].toString();
    tdsValue = json['tdsValue'].toString();
    temperatureCelsius = json['temperatureCelsius'].toString();
    Date = json['Date'].toString();
    Time = json['Time'].toString();
    //sauLevel = json['temperatureCelsius'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['id'] = this.id;
    data['tdsValue'] = this.tdsValue;
    data['temperatureCelsius'] = this.temperatureCelsius;
    data['Date'] = this.Date;
    data['Time'] = this.Time;
    //data['sauLevel'] = this.sauLevel;
    return data;
  }
}
