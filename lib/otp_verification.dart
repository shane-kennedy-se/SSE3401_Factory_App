import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab_5_2/main.dart';

class OTPVerificationPage extends StatefulWidget {
  const OTPVerificationPage({Key? key}) : super(key: key);

  @override
  _OTPVerificationPageState createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  final _formKey = GlobalKey<FormState>();
  String? otp;
  TextEditingController otpController = TextEditingController();

  void initState() {
    super.initState();
    otpController.text = '';
    otpController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    'images/logo.jpg',
                    width: 200,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Welcome',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 42,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(0.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(
                            0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 14.0, top: 18),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: Text(
                                  'Enter the activation code you received via SMS.',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.normal,
                                    fontSize: 22,
                                  ),
                                )),
                            Padding(
                              padding: EdgeInsets.only(right: 22.0),
                              child: Icon(Icons.info_outline_rounded,
                                  size: 32),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 0.0),
                        child: Column(
                          children: [
                            Container(
                              height: 60,
                              width: 350,
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: TextFormField(
                                controller: otpController,
                                decoration: const InputDecoration(
                                  hintText: 'OTP',
                                  hintStyle: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.normal,
                                    fontSize: 20,
                                  ),
                                  border: InputBorder.none,
                                ),
                                keyboardType: TextInputType.phone,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20,
                                ),
                                validator: (value) {
                                  if (value?.isEmpty ?? true) {
                                    return 'Please enter the OTP';
                                  }
                                  return null;
                                },
                                onSaved: (value) => otp = value ?? '',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 30.0),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  '${otpController.text.length}/6',
                                  style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.normal,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),

                const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Didn't receive?",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          text: ' Tap Here',
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  key: const Key("activateButton"),
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      _formKey.currentState?.save();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  MyApp(),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200, 60),
                  ),
                  child: const Text(
                    'Activate',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.normal,
                      fontSize: 22,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Copyright UPM & Kejuruteraan Minyak Sawit CCS Sdn. Bhd.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}