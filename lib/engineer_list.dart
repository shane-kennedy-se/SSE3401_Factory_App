import 'package:flutter/material.dart';
import 'package:lab_5_2/invitation.dart';
import 'package:lab_5_2/registration_page.dart';

class Engineer {
  final String name;
  final String phoneNumber;

  Engineer({required this.name, required this.phoneNumber});
}

class ButtonData {
  final String title;
  final Color buttonColor;

  ButtonData({required this.title, required this.buttonColor});
}

class EngineerListPage extends StatefulWidget {
  const EngineerListPage({Key? key}) : super(key: key);

  @override
  _EngineerListPageState createState() => _EngineerListPageState();
}

class _EngineerListPageState extends State<EngineerListPage> {
  List<Engineer> engineers = [
    Engineer(name: 'Ben', phoneNumber: '+60109219938'),
    Engineer(name: 'Testing 1', phoneNumber: '+601234567891'),
    Engineer(name: 'Testing 2', phoneNumber: '+60123456789'),
  ]; // Add your list of engineers here

  int selectedIndex = -1;
  String selectedTitle = '';

  List<ButtonData> buttonDataList = [
    ButtonData(title: 'Factory 1', buttonColor: Colors.red),
    ButtonData(title: 'Factory 2', buttonColor: Colors.green),
    ButtonData(title: 'Factory 3', buttonColor: Colors.blue),
  ];

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Adjust the layout based on the screen size
    double fontSize = screenWidth > 600 ? 25.0 : 20.0;
    double buttonWidth = screenWidth / 2; // Adjust the button width here
    double buttonHeight = 150;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Center(
          child: Text(
            selectedTitle,
            key: Key('topTitle'),// Use the selectedTitle variable here
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 42,
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            key: Key('registrationPageIcon'),
            icon: const Icon(Icons.settings, color: Colors.blueGrey, size: 35.0),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegistrationPage()),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0.0, bottom: 20),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: ListView.builder(
                        itemCount: engineers.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Card(
                              child: ListTile(
                                leading: const Padding(
                                  padding:  EdgeInsets.only(top: 40.0, left: 10),
                                  child:  Icon(Icons.circle, size: 10, color: Colors.grey,),
                                ),
                                title: Text(engineers[index].name, style:
                                const TextStyle(
                                  fontSize: 25,
                                  fontFamily: 'Poppins',
                                ),
                                ),
                                subtitle: Text(engineers[index].phoneNumber, style:
                                const TextStyle(
                                  fontSize: 25,
                                  fontFamily: 'Poppins',
                                ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0.0, bottom: 20),
                  child: SizedBox(
                    height: buttonHeight,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal, // Set scroll direction to horizontal
                      itemCount: buttonDataList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              side: BorderSide(
                                color: selectedIndex == index
                                    ? Colors.lightBlue
                                    : Colors.transparent,
                                width: 2,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              minimumSize: Size(buttonWidth, buttonHeight), // Adjusted button size
                              elevation: 5,
                              shadowColor: selectedIndex == index ? Colors.lightBlue : null,
                            ),
                            onPressed: () {
                              setState(() {
                                selectedIndex = index;
                                selectedTitle = buttonDataList[index].title; // Update the selectedTitle variable here
                              });
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.factory, size: 40),
                                const SizedBox(height: 20),
                                Text(buttonDataList[index].title,
                                    style: TextStyle(
                                        fontSize: fontSize, fontFamily: 'Poppins')), // Keep the existing font size
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 230,
              right: 40,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InvitationPage(title: selectedTitle)),
                  );
                },
                backgroundColor: Colors.deepPurple[100],
                foregroundColor: Colors.deepPurple,
                child: const Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}