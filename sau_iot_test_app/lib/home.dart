import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sau_iot_test_app/model/member.dart';
import 'package:sau_iot_test_app/view/home3_ui.dart';
import 'package:sau_iot_test_app/view/login_UI.dart';
import 'package:sau_iot_test_app/view/map.dart';
import 'package:sau_iot_test_app/view/tdsgraph_ui.dart';
import 'package:sau_iot_test_app/view/tempgraph_ui.dart';

class HomeUI extends StatefulWidget {
  Member? member;
  HomeUI({super.key, this.member});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 230, 230),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 230, 230, 230),
        title: Text(
          "HOME",
          style: GoogleFonts.lemon(),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginUI()));
              },
              icon: Icon(FontAwesomeIcons.lockOpen))
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text(
                'ชื่อ:' + widget.member!.memFullname!,
              ),
              Text(
                'อีเมล:' + widget.member!.memEmail!,
              ),
              Text(
                'อายุ:' + widget.member!.memAge!,
              ),
            ],
          ),
          //ทำดินฟ้าอากาศที่นี่
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                widget.member!.memFullname!,
                style: GoogleFonts.lemon(fontSize: MediaQuery.of(context).size.width * 0.04,
                color: Color.fromARGB(255, 0, 0, 0),),
              ),
              accountEmail: Text(
                widget.member!.memEmail!,
                style: GoogleFonts.lemon(fontSize: MediaQuery.of(context).size.width * 0.04,
                color: Color.fromARGB(255, 0, 0, 0),),
              ),
              currentAccountPicture: FlutterLogo(),
              decoration: BoxDecoration(color: const Color.fromARGB(255, 230, 230, 230),),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Home3UI()));
              },
              leading: Icon(
                Icons.data_usage,
                color: Colors.amber,
              ),
              title: Text(
                'ตารางข้อมูล',
                style: GoogleFonts.kanit(),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => TDSUI()));
              },
              leading: Icon(
                Icons.graphic_eq_sharp,
                color: Colors.amber,
              ),
              title: Text(
                'TDS Graph',
                style: GoogleFonts.kanit(),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => TempUI()));
              },
              leading: Icon(
                Icons.graphic_eq,
                color: Colors.amber,
              ),
              title: Text(
                'Temperature Graph',
                style: GoogleFonts.kanit(),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MapSample()));
              },
              leading: Icon(
                Icons.gps_fixed,
                color: Colors.amber,
              ),
              title: Text(
                'GPS',
                style: GoogleFonts.kanit(),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
