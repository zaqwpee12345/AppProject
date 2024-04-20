import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sau_iot_test_app/model/nodemcu_write.dart';
import 'package:sau_iot_test_app/util/env.dart';

class callAPIdatanodemcu {
 
 static Future<List<Nodemcu_write>> getallAPI() async {
    final response = await http.get(
      Uri.parse('${Env.URLAPI}get_all_data.php'),
      headers: {'Content-Tpye': 'application/json'},
    );
    //ตรวจสอบข้อมูลที่ได้มา
    if (response.statusCode == 200) {
            //แปลงข้อมูล JSON ให้เป็นข้อมูลที่จะนำมาใช้ใน App
      final responseData = jsonDecode(response.body);
        final responseDataList = await responseData.map<Nodemcu_write>((json) {
        return Nodemcu_write.fromJson(json);
      }).toList();

      //ส่งค่ากลับไปยังจุดที่เรียกใช้ method นี้เพื่อเอาค่าที่ได้ไปใช้งาน
      return responseDataList;

    } else {
      throw Exception('Fail to fetch data');
    }

    
  }
 
}

