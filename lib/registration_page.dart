import 'package:flutter/material.dart';
import 'otp_verification.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() {
    return _RegistrationPageState();
  }
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  String? phoneNumber;
  bool isAgreed = false;

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const OTPVerificationPage(),
        ),
      );
    }
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
                Column(
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
                          'Welcome !',
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
                        color: Colors.red[100],
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
                                      'Enter your mobile number to activate your account.',
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
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 28.0),
                                child: Image.asset(
                                  'images/malaysia.png',
                                  height: 30,
                                  width: 30,
                                ),
                              ),
                              const Text('+60',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5, // Set width to 50% of the screen width
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 0.0),
                                  child: Container(
                                    height: 60,
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: '',
                                        contentPadding: EdgeInsets.symmetric(vertical: 22),
                                      ),
                                      keyboardType: TextInputType.phone,
                                      textAlignVertical: TextAlignVertical.center,
                                      style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.normal,
                                        fontSize: 20,
                                      ),
                                      validator: (value) {
                                        if (value?.isEmpty ?? true) {
                                          return 'Please enter your phone number';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) => phoneNumber = value ?? '',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 14.0),
                              child: CheckboxListTile(
                                title: const Text(
                                  "I agree to terms & conditions",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.normal,
                                    fontSize: 18,
                                  ),
                                ),
                                value: isAgreed,
                                activeColor: Colors.blue,
                                onChanged: (newValue) {
                                  setState(() {
                                    isAgreed = newValue!;
                                  });
                                },
                                controlAffinity:
                                ListTileControlAffinity.leading,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 40.0),
                            child: ElevatedButton(
                              key: Key('getActivationCodeButton'),
                              onPressed: _submitForm,
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(200, 60),
                              ),
                              child: const Text(
                                'Get Activation Code',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text.rich(
                  TextSpan(
                    text: 'Disclaimer | Privacy Statement',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
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
