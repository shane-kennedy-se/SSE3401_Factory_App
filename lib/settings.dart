import 'package:flutter/material.dart';

class ButtonData {
  final String title;

  ButtonData.buttonName({required this.title});
}

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int selectedIndex = 0;
  List<ButtonData> buttonDataList = [
    ButtonData.buttonName(
      title: 'Factory 1',
    ),
    ButtonData.buttonName(
      title: 'Factory 2',
    ),
    ButtonData.buttonName(
      title: 'Factory 3',
    ),
  ];
  ButtonData? currentButtonData;
  String title = '';
  DateTime currentTime = DateTime.now();


  @override
  Widget build(BuildContext context) {
    // Get the screen size
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

// Adjust the layout based on the screen size
    double fontSize = screenWidth > 600 ? 25.0 : 20.0;
    double buttonWidth = screenWidth / 2; // Adjust the button width here
    double buttonHeight = 150;
    const double textFieldSpacing = 10.0;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Center(
          child: Text(
            currentButtonData?.title ?? 'Factory Status',
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 42,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: LayoutBuilder(builder: (context, constraints) {
            return Center(
              child: Container(
                width: constraints.maxWidth,
                padding: const EdgeInsets.all(0.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Maintenance Threshold',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 50.0),
                              child: Icon(
                                Icons.info_outline,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        buildGridItem('Steam', 'Pressure', 'Bar', textFieldSpacing, fontSize),
                        buildGridItem('Steam', 'Flow', 'T/H', textFieldSpacing, fontSize),
                        buildGridItem('Water', 'Level', '%', textFieldSpacing, fontSize),
                        buildGridItem('Power', 'Frequency', 'Hz', textFieldSpacing, fontSize),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 70,
        child: RawMaterialButton(
          onPressed: () {

          },
          fillColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          padding: const EdgeInsets.all(15.0),
          child: const Icon(Icons.edit, color: Colors.deepPurple),
        ),
      ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(top: 0.0, bottom: 20),
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
                        currentButtonData = buttonDataList[index];
                        title = currentButtonData?.title ?? '';
                        currentTime = DateTime.now();
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
    );
  }

  Widget buildGridItem(String firstWord, String secondWord, String unit, double spacing, double fontSize) {
    return Column(
      children: [
        Column(
          children: [
            Text(
              firstWord,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: fontSize,
              ),
            ),
            Text(
              secondWord,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: fontSize,
              ),
            ),
          ],
        ),
        SizedBox(height: spacing), // Use the adjusted spacing here
        Center(
          child: Container(
            height: 50,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.grey[200],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                      labelText: '',
                      labelStyle: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    unit,
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}