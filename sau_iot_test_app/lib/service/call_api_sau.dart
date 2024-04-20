import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sau_iot_test_app/model/sau.dart';
//import 'package:iot_sau_app/models/sau.dart';
import 'package:sau_iot_test_app/util/env.dart';
//import 'package:iot_sau_app/utils/env.dart';

class CallAPISau {
  //เมธอดที่เรียกใช้ API get all
  static Future<List<Sau>> callApiGetAll() async {
    //เรียกใช้ API
    //ทั้งนี้เป็น API ที่มีการส่งค่ากลับมา จึงต้องมีตัวแปรมาเก็บค่าที่ส่งกลับมาเวลาเรียกใช้
    final response = await http.get(
      Uri.parse('${Env.urlApi}get_all_sau_api.php'),
      headers: {'Content-Tpye': 'application/json'},
    );

    //ตรวจสอบสถานะของผลการเรียกใช้ API
    if (response.statusCode == 200) {
      //แปลงข้อมูล JSON ให้เป็นข้อมูลที่จะนำมาใช้ใน App
      final responseData = jsonDecode(response.body);

      //แปลงข้อมูลก่อนหน้าให้อยู่ในรูปแบบของ List
      final responseDataList = await responseData.map<Sau>((json) {
        return Sau.fromJson(json);
      }).toList();

      //ส่งค่ากลับไปยังจุดที่เรียกใช้ method นี้เพื่อเอาค่าที่ได้ไปใช้งาน
      return responseDataList;
    } else {
      throw Exception('Fail to fetch data');
    }
  }

  //เมธอดที่เรียกใช้ API get by name
  static Future<List<Sau>> callApiGetByName(Sau sau) async {
    //เรียกใช้ API
    //ทั้งนี้เป็น API ที่มีการส่งค่ากลับมา จึงต้องมีตัวแปรมาเก็บค่าที่ส่งกลับมาเวลาเรียกใช้
    final response = await http.post(
      Uri.parse('${Env.urlApi}get_sau_by_name_api.php'),
      headers: {'Content-Tpye': 'application/json'},
      body: jsonEncode(sau.toJson()),
    );

    //ตรวจสอบสถานะของผลการเรียกใช้ API
    if (response.statusCode == 200) {
      //แปลงข้อมูล JSON ให้เป็นข้อมูลที่จะนำมาใช้ใน App
      final responseData = jsonDecode(response.body);

      //แปลงข้อมูลก่อนหน้าให้อยู่ในรูปแบบของ List
      final responseDataList = await responseData.map<Sau>((json) {
        return Sau.fromJson(json);
      }).toList();

      //ส่งค่ากลับไปยังจุดที่เรียกใช้ method นี้เพื่อเอาค่าที่ได้ไปใช้งาน
      return responseDataList;
    } else {
      throw Exception('Fail to fetch data');
    }
  }

  //เมธอดที่เรียกใช้ API insert --------------------------------------
  static Future<String> callApiInsert(Sau sau) async {
    //เรียกใช้ API
    //ทั้งนี้เป็น API ที่มีการส่งค่ากลับมา จึงต้องมีตัวแปรมาเก็บค่าที่ส่งกลับมาเวลาเรียกใช้
    final response = await http.post(
      Uri.parse('${Env.urlApi}insert_sau_api.php'),
      headers: {'Content-Tpye': 'application/json'},
      body: jsonEncode(sau.toJson()),
    );

    //ตรวจสอบสถานะของผลการเรียกใช้ API
    if (response.statusCode == 200) {
      //แปลงข้อมูล JSON ให้เป็นข้อมูลที่จะนำมาใช้ใน App
      final responseData = jsonDecode(response.body);

      //ส่งค่ากลับไปยังจุดที่เรียกใช้ method นี้เพื่อเอาค่าที่ได้ไปใช้งาน
      return responseData['message'];
    } else {
      throw Exception('Fail to fetch data');
    }
  }

  //เมธอดที่เรียกใช้ API update --------------------------------------
  static Future<String> callApiUpdate(Sau sau) async {
    //เรียกใช้ API
    //ทั้งนี้เป็น API ที่มีการส่งค่ากลับมา จึงต้องมีตัวแปรมาเก็บค่าที่ส่งกลับมาเวลาเรียกใช้
    final response = await http.post(
      Uri.parse('${Env.urlApi}update_sau_api.php'),
      headers: {'Content-Tpye': 'application/json'},
      body: jsonEncode(sau.toJson()),
    );

    //ตรวจสอบสถานะของผลการเรียกใช้ API
    if (response.statusCode == 200) {
      //แปลงข้อมูล JSON ให้เป็นข้อมูลที่จะนำมาใช้ใน App
      final responseData = jsonDecode(response.body);

      //ส่งค่ากลับไปยังจุดที่เรียกใช้ method นี้เพื่อเอาค่าที่ได้ไปใช้งาน
      return responseData['message'];
    } else {
      throw Exception('Fail to fetch data');
    }
  }

  //เมธอดที่เรียกใช้ API delete --------------------------------------
  static Future<String> callApiDelete(Sau sau) async {
    //เรียกใช้ API
    //ทั้งนี้เป็น API ที่มีการส่งค่ากลับมา จึงต้องมีตัวแปรมาเก็บค่าที่ส่งกลับมาเวลาเรียกใช้
    final response = await http.post(
      Uri.parse('${Env.urlApi}delete_sau_api.php'),
      headers: {'Content-Tpye': 'application/json'},
      body: jsonEncode(sau.toJson()),
    );

    //ตรวจสอบสถานะของผลการเรียกใช้ API
    if (response.statusCode == 200) {
      //แปลงข้อมูล JSON ให้เป็นข้อมูลที่จะนำมาใช้ใน App
      final responseData = jsonDecode(response.body);

      //ส่งค่ากลับไปยังจุดที่เรียกใช้ method นี้เพื่อเอาค่าที่ได้ไปใช้งาน
      return responseData['message'];
    } else {
      throw Exception('Fail to fetch data');
    }
  }
}
