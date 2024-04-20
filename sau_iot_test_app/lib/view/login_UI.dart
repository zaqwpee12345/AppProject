import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sau_iot_test_app/home.dart';
import 'package:sau_iot_test_app/model/member.dart';
import 'package:sau_iot_test_app/service/call_member_api.dart';
import 'package:sau_iot_test_app/view/register_ui1.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginUI extends StatefulWidget {
  const LoginUI({super.key});

  @override
  State<LoginUI> createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  TextEditingController memUssernameCtrl = TextEditingController(text: '');
  TextEditingController memPasswordCtrl = TextEditingController(text: '');
  bool rememberCheckboxValue = false;

  showWarningDialog(context, msg) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Align(
          alignment: Alignment.center,
          child: Text(
            'Warning',
            style: GoogleFonts.kanit(),
          ),
        ),
        content: Text(
          msg,
          style: GoogleFonts.kanit(),
        ),
        actions: [
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'OK',
                style: GoogleFonts.kanit(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Member? member;

  Future<Member> checkLogin() {
    return CallMemberAPI.loginAPI(member!);
  }

  void saveCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('rememberedUsername', memUssernameCtrl.text.trim());
    prefs.setString('rememberedPassword', memPasswordCtrl.text.trim());
  }

  void retrieveCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String rememberedUsername = prefs.getString('rememberedUsername') ?? '';
    String rememberedPassword = prefs.getString('rememberedPassword') ?? '';

    setState(() {
      memUssernameCtrl.text = rememberedUsername;
      memPasswordCtrl.text = rememberedPassword;
    });
  }

  @override
  void initState() {
    super.initState();
    retrieveCredentials();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 230, 230, 230),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Image.asset(
                'assets/images/boat2.png',
                height: MediaQuery.of(context).size.width * 0.45,
              ),
              Text(
                'SmartBoatApp Login',
                style: GoogleFonts.lemon(
                  fontSize: MediaQuery.of(context).size.height * 0.025,
                  color: Color.fromARGB(255, 124, 185, 255),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Username:',
                    style: GoogleFonts.kanit(
                      color: Colors.grey,
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1,
                  right: MediaQuery.of(context).size.width * 0.1,
                  top: MediaQuery.of(context).size.height * 0.015,
                ),
                child: TextField(
                  controller: memUssernameCtrl,
                  decoration: InputDecoration(
                    hintText: 'Enter username',
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Password:',
                    style: GoogleFonts.kanit(
                      color: Colors.grey,
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1,
                  right: MediaQuery.of(context).size.width * 0.1,
                  top: MediaQuery.of(context).size.height * 0.015,
                ),
                child: TextField(
                  controller: memPasswordCtrl,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Enter password',
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
              CheckboxListTile(
                title: Text(
                  'Remember me',
                  style: GoogleFonts.kanit(
                    color: Colors.grey,
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                  ),
                ),
                controlAffinity: ListTileControlAffinity.leading,
                value: rememberCheckboxValue,
                onChanged: (value) {
                  setState(() {
                    rememberCheckboxValue = value!;
                  });
                },
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1,
                  right: MediaQuery.of(context).size.width * 0.1,
                  top: MediaQuery.of(context).size.height * 0.03,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    if (memUssernameCtrl.text.trim().length <= 0) {
                      showWarningDialog(context, 'Enter username');
                    } else if (memPasswordCtrl.text.trim().length <= 0) {
                      showWarningDialog(context, 'Enter password');
                    } else {
                      member = Member(
                          memUsername: memUssernameCtrl.text.trim(),
                          memPassword: memPasswordCtrl.text.trim());
                      checkLogin().then((value) => {
                            print(value.massage),
                            if (value.massage == '1')
                              {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomeUI(
                                        member: value,
                                      ),
                                    ))
                              }
                            else
                              {
                                showWarningDialog(
                                    context, 'Invalid username or password')
                              }
                          });
                      if (rememberCheckboxValue) {
                        saveCredentials();
                      }
                    }
                  },
                  child: Text(
                    'Login',
                    style: GoogleFonts.kanit(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    fixedSize: Size(
                      MediaQuery.of(context).size.width * 0.8,
                      MediaQuery.of(context).size.height * 0.07,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1,
                  right: MediaQuery.of(context).size.width * 0.1,
                  top: MediaQuery.of(context).size.height * 0.03,
                  bottom: MediaQuery.of(context).size.height * 0.1,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterUI1()),
                    );
                  },
                  child: Text(
                    'Register',
                    style: GoogleFonts.kanit(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    fixedSize: Size(
                      MediaQuery.of(context).size.width * 0.8,
                      MediaQuery.of(context).size.height * 0.07,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
