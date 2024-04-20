import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sau_iot_test_app/util/env.dart';
import 'package:sau_iot_test_app/model/member.dart';

class CallMemberAPI {
  static Future<Member> loginAPI(Member member) async {
    print(member.memUsername! + member.memPassword!);
    final responseData = await http.post(
        Uri.parse(
          Uri.decodeFull(Env.apiURL + '/login'),
        ),
        body: json.encode(member.toJson()),
        headers: {"Content-type": "application/json"});
    if (responseData.statusCode == 200) {
      final data = await json.decode(responseData.body);
      print(data.toString());
      return Member.fromJson(data);
    } else {
      throw Exception('Fail: ${responseData.toString()}');
    }
  }
}
