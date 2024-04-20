import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sau_iot_test_app/model/nodemcu_write.dart';
import 'package:sau_iot_test_app/model/sau.dart';
import 'package:sau_iot_test_app/service/call_api_data_nodemcu.dart';
import 'package:sau_iot_test_app/service/call_api_sau.dart';
//หน้าเเสดงตาราง
class Home3UI extends StatefulWidget {
  const Home3UI({super.key});

  @override
  State<Home3UI> createState() => _Home3UIState();
}

class _Home3UIState extends State<Home3UI> {
//ตัวแปรเก็บข้อมูลที่มาจาก server
  Future<List<Nodemcu_write>>? nodemcuList;
//สร้างเมดตอด
  getCallApiGetAll() {
    setState(() {
      nodemcuList = callAPIdatanodemcu.getallAPI();
    });
  }

  @override
  void initState() {
    getCallApiGetAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 33, 150, 243),
        title: Text(
          '',
          style: GoogleFonts.kanit(),
        ),
        centerTitle: true,
          actions: [
    IconButton(
      icon: Icon(Icons.refresh),
      onPressed: () {
        getCallApiGetAll();
      },
    ),
  ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.001,
            ),
            Image.asset(
              'assets/images/logo.png',
              height: MediaQuery.of(context).size.width * 0.5,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.001,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 5,
                right: 5,
              ),
              child: Column(
                children: [
                  Container(
                    height: 2.0,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 22,
                        width: 2,
                        color: Colors.black,
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            'id',
                            style: GoogleFonts.kanit(),
                          ),
                        ),
                      ),
                      Container(
                        height: 22,
                        width: 2,
                        color: Colors.black,
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            'TDSValue',
                            style: GoogleFonts.kanit(),
                          ),
                        ),
                      ),
                      Container(
                        height: 22,
                        width: 2,
                        color: Colors.black,
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            'temp',
                            style: GoogleFonts.kanit(),
                          ),
                        ),
                      ),
                      Container(
                        height: 22,
                        width: 2,
                        color: Colors.black,
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            'Date',
                            style: GoogleFonts.kanit(),
                          ),
                        ),
                      ),
                      Container(
                        height: 22,
                        width: 2,
                        color: Colors.black,
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            'Time',
                            style: GoogleFonts.kanit(),
                          ),
                        ),
                      ),
                      Container(
                        height: 22,
                        width: 2,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  Container(
                    height: 2.0,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            Expanded(
              child: 
              FutureBuilder(
                future: nodemcuList,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    return 
                    ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(
                          left: 5,
                          right: 5,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 20,
                                  width: 2,
                                  color: Colors.black,
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      snapshot.data[index].id,
                                      style: GoogleFonts.kanit(fontSize: 11),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 20,
                                  width: 2,
                                  color: Colors.black,
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      snapshot.data[index].tdsValue,
                                      style: GoogleFonts.kanit(fontSize: 11),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 20,
                                  width: 2,
                                  color: Colors.black,
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      snapshot.data[index].temperatureCelsius,
                                      style: GoogleFonts.kanit(fontSize: 11),
                                    ),
                                  ),
                                ),
                                 Container(
                                  height: 20,
                                  width: 2,
                                  color: Colors.black,
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      snapshot.data[index].Date,
                                      style: GoogleFonts.kanit(fontSize: 11),
                                    ),
                                  ),
                                ),
                                 Container(
                                  height: 20,
                                  width: 2,
                                  color: Colors.black,
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      snapshot.data[index].Time,
                                      style: GoogleFonts.kanit(fontSize: 11),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 20,
                                  width: 2,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                            Container(
                              height: 2.0,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text('มีข้อผิดพลาด กรุณาโหลดใหม่');
                  }
                  return Center(
                    child: CircularProgressIndicator(color: Colors.amber),
                  );
                },
              ),
           
            ),  
           
          ],
        ),
      ),

    );
  }
}
