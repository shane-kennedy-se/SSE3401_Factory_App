import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class InvitationPage extends StatefulWidget {
  final String title;
  const InvitationPage({Key? key, required this.title}) : super(key: key);

  @override
  _InvitationPageState createState() => _InvitationPageState();
}

class _InvitationPageState extends State<InvitationPage> {
  final _formKey = GlobalKey<FormState>();
  String? invitationCode;

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      Navigator.pop(context); // Add this line
    }
  }
  String? phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.black,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 40,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Text(
                  'Invitation',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 42,
                  ),
                ),
                const Text(
                  'Invite users',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.normal,
                    fontSize: 22,
                  ),
                ),
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 16.0, top: 18),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: Text(
                                "Owner's Name",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 22,
                                ),
                              )
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 28.0),
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
                            labelText: 'Type here',
                            labelStyle: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 20,
                            ),
                            hintText: '',
                          ),
                          keyboardType: TextInputType.text,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                          ),
                          onSaved: (value) => phoneNumber = value ?? '',
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 40,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 14.0, top: 18),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: Text(
                                "Owner's Phone Number",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 22,
                                ),
                              )
                          ),
                        ],
                      ),
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
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 0.0),
                              child: Container(
                                height: 60,
                                width: 250,
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Enter your phone number.',
                                    labelStyle: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 20,
                                    ),
                                    hintText: '',
                                  ),
                                  keyboardType: TextInputType.phone,
                                  style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.normal,
                                    fontSize: 20,
                                  ),

                                  onSaved: (value) => phoneNumber = value ?? '',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40.0),
                      child: ElevatedButton(
                        onPressed: _submitForm,
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(200, 60),
                          backgroundColor: Colors.grey[500]
                        ),
                        child: const Text(
                          'Submit',
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
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
