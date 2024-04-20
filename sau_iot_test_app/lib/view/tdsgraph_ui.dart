import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:sau_iot_test_app/model/sau.dart';
import 'package:sau_iot_test_app/service/call_api_data_nodemcu.dart';
import 'package:sau_iot_test_app/service/call_api_sau.dart';
import 'package:sau_iot_test_app/model/nodemcu_write.dart';

class TDSUI extends StatefulWidget {
  const TDSUI({Key? key}) : super(key: key);

  @override
  State<TDSUI> createState() => _TDSUIState();
}

class _TDSUIState extends State<TDSUI> {
  // Variable to store data from the server
  Future<List<Nodemcu_write>>? nodemcuList;

  // Method to make API call and get data
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

  // Method to handle manual data refresh
  void _refreshData() {
    getCallApiGetAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 230, 230, 230),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 230, 230, 230),
        title: Text(
          'TDS Graph',
          style: GoogleFonts.lemon(),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _refreshData,
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/images/boat2.png',
              height: MediaQuery.of(context).size.width * 0.3,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [],
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: nodemcuList,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    return Column(
                      children: [
                        Expanded(
                          flex: 100,
                          child: LineChart(
                            LineChartData(
                              gridData: FlGridData(show: true),
                              titlesData: FlTitlesData(show: true),
                              borderData: FlBorderData(
                                show: true,
                                border: Border.all(
                                  color: const Color(0xff37434d),
                                  width: 1,
                                ),
                              ),
                              minX: 0,
                              maxX: snapshot.data.length.toDouble() - 1,
                              minY: 0,
                              maxY:
                                  1000, // Set your maximum temperature value here
                              lineBarsData: [
                                LineChartBarData(
                                  spots: List.generate(
                                    snapshot.data.length,
                                    (index) => FlSpot(
                                      index.toDouble(),
                                      double.parse(
                                          snapshot.data[index].tdsValue),
                                    ),
                                  ),
                                  isCurved: false,
                                  color: Colors.black,
                                  dotData: FlDotData(show: true),
                                  belowBarData: BarAreaData(show: true),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error loading data. Please try again.');
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
