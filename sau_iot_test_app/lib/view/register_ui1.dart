import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:sau_iot_test_app/model/member.dart';


class RegisterUI1 extends StatefulWidget {
  const RegisterUI1({super.key});

  @override
  State<RegisterUI1> createState() => _RegisterUI1State();
}

class _RegisterUI1State extends State<RegisterUI1> {
  //สร้างตัวควบคุม TextFiled เพื่อนำไปใช้ในการเขียนโค้ด
  TextEditingController memFullnameCtrl = TextEditingController(text: '');
  TextEditingController memUsernameCtrl = TextEditingController(text: '');
  TextEditingController memEmailCtrl = TextEditingController(text: '');
  TextEditingController memPasswordCtrl = TextEditingController(text: '');
  TextEditingController memAgeCtrl = TextEditingController(text: '');

  //สร้างตัวแปรควบคุมรหัสผ่าน
  bool passwordShowFlag = true;

  //สร้างเมธตอดแสดง Dialog เป็นข้อความเตือน
  showWarningDialog(BuildContext context, String msg) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'คำเตือน',
            style: GoogleFonts.kanit(),
          ),
          content: Text(
            msg,
            style: GoogleFonts.kanit(),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'OK',
                style: GoogleFonts.kanit(),
              ),
            )
          ],
        );
      },
    );
  }

  Future showCompreateDialog(BuildContext context, String msg) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'ผลการทำงาน',
            style: GoogleFonts.kanit(),
          ),
          content: Text(
            msg,
            style: GoogleFonts.kanit(),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'OK',
                style: GoogleFonts.kanit(),
              ),
            )
          ],
        );
      },
    );
  }

  //สร้างเมธตอดบันทึกข้อมูล User
  Future<void> sign_up() async {
    String url = "https://s6319410019.sautechnology.com/sautestapi/apis/apiregister.php";

    Member member = Member(
      memFullname: memFullnameCtrl.text.trim(),
      memUsername: memUsernameCtrl.text.trim(),
      memPassword: memPasswordCtrl.text.trim(),
      memEmail: memEmailCtrl.text.trim(),
      memAge: memAgeCtrl.text.trim()
    );

    print("xxxxxxxxxxx" + memFullnameCtrl.text.trim() );

    
    try {

      final response = await http.post(Uri.parse(url), body: json.encode(member.toJson()));
      


      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        if (data != 0) {
          showCompreateDialog(context, 'บันทึกข้อมูลเรียบร้อยแล้ว').then(
            (value) => Navigator.pop(context),
          );
        } else {
          showCompreateDialog(context, 'มีข้อผิดพลาดเกิดขึ้นในการบันทึกข้อมูล');
        }
      } else {
        // Handle HTTP error
        showWarningDialog(context, 'HTTP Error: ${response.statusCode}');
      }
    } catch (e) {
      // Handle other errors
      showWarningDialog(context, 'Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 230, 230, 230),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 230, 230, 230),
        title: Text("Register",style: GoogleFonts.lemon(fontSize: MediaQuery.of(context).size.width * 0.05,
                color: Color.fromARGB(255, 0, 0, 0),),),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.15,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.15,
                  right: MediaQuery.of(context).size.width * 0.15,
                  bottom: MediaQuery.of(context).size.width * 0.05,
                ),
                child: TextField(
                  controller: memFullnameCtrl,
                  style: GoogleFonts.kanit(),
                  decoration: InputDecoration(
                    labelText: 'ชื่อ-สกุล',
                    labelStyle: GoogleFonts.kanit(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: 'ป้อนชื่อนามสกุล',
                    hintStyle: GoogleFonts.kanit(
                      color: Colors.grey[400],
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.15,
                  right: MediaQuery.of(context).size.width * 0.15,
                  bottom: MediaQuery.of(context).size.width * 0.05,
                ),
                child: TextField(
                  controller: memEmailCtrl,
                  keyboardType: TextInputType.emailAddress,
                  style: GoogleFonts.kanit(),
                  decoration: InputDecoration(
                    labelText: 'อีเมล์',
                    labelStyle: GoogleFonts.kanit(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: 'ป้อนอีเมล์',
                    hintStyle: GoogleFonts.kanit(
                      color: Colors.grey[400],
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.15,
                  right: MediaQuery.of(context).size.width * 0.15,
                  bottom: MediaQuery.of(context).size.width * 0.05,
                ),
                child: TextField(
                  controller: memAgeCtrl,
                  keyboardType: TextInputType.phone,
                  style: GoogleFonts.kanit(),
                  decoration: InputDecoration(
                    labelText: 'อายุ',
                    labelStyle: GoogleFonts.kanit(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: 'ป้อนอายุ',
                    hintStyle: GoogleFonts.kanit(
                      color: Colors.grey[400],
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.15,
                  right: MediaQuery.of(context).size.width * 0.15,
                  bottom: MediaQuery.of(context).size.width * 0.05,
                ),
                child: TextField(
                  controller: memUsernameCtrl,
                  style: GoogleFonts.kanit(),
                  decoration: InputDecoration(
                    labelText: 'ชื่อผู้ใช้',
                    labelStyle: GoogleFonts.kanit(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: 'ป้อนชื่อผู้ใช้',
                    hintStyle: GoogleFonts.kanit(
                      color: Colors.grey[400],
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.15,
                  right: MediaQuery.of(context).size.width * 0.15,
                  bottom: MediaQuery.of(context).size.width * 0.05,
                ),
                child: TextField(
                  obscureText: passwordShowFlag,
                  controller: memPasswordCtrl,
                  style: GoogleFonts.kanit(),
                  decoration: InputDecoration(
                    labelText: 'รหัสผ่าน',
                    labelStyle: GoogleFonts.kanit(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: 'ป้อนรหัสผ่าน',
                    hintStyle: GoogleFonts.kanit(
                      color: Colors.grey[400],
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          if (passwordShowFlag == true) {
                            passwordShowFlag = false;
                          } else {
                            passwordShowFlag = true;
                          }
                        });
                      },
                      icon: Icon(
                        passwordShowFlag == true
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                  
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              ElevatedButton(
                onPressed: () {
                  //Validate หน้าจอ ณ ที่นี้คือตรวจสอบว่าผ้อนครบไหม / เ
                  //หากยังให้แสดง Dialog เตือน
                  //ป้อนครบเรียบร้อยแล้วให้บันทึกลง  Database:  แล้วกลับไปหน้า Login
                  if (memFullnameCtrl.text.trim().length == 0) {
                    showWarningDialog(context, 'ป้อนชื่อ-สกุลด้วย...');
                  } else if (memEmailCtrl.text.trim().length == 0) {
                    showWarningDialog(context, 'ป้อนอีเมลด้วย...');
                  } else if (memAgeCtrl.text.trim().length == 0) {
                    showWarningDialog(context, 'ป้อนอายุด้วยด้วย...');
                  } else if (memUsernameCtrl.text.trim().length == 0) {
                    showWarningDialog(context, 'ป้อนชื่อผู้ใช้ด้วย...');
                  } else if (memPasswordCtrl.text.trim().length == 0) {
                    showWarningDialog(context, 'ป้อนรหัสผ่านด้วย...');
                  } else {
                    //ผ่าน if ทั้งหมดมาพร้อมที่จะนำข้อมูลเก็บลง Database
                    sign_up();
                  }
                },
                child: Text(
                  'ลงทะเบียน',
                  style: GoogleFonts.kanit(fontSize: MediaQuery.of(context).size.width * 0.04,
                color: Color.fromARGB(255, 0, 0, 0),),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(
                    MediaQuery.of(context).size.width * 0.7,
                    MediaQuery.of(context).size.width * 0.125,
                  ),
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
