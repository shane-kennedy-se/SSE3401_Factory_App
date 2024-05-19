import 'package:flutter/material.dart';
import 'package:lab_5_2/gauge.dart';
import 'dart:async';
import 'package:intl/intl.dart';

class ButtonData {
  final String title;
  final List<double> gaugeValues;
  final int totalPowerConsumption;
  final String unreachableTitle;
  final String mainText;
  final Color gaugeColor;

  ButtonData(
      {required this.title,
        required this.gaugeValues,
        required this.totalPowerConsumption,
        required this.unreachableTitle,
        required this.mainText,
        required this.gaugeColor});
}

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String title = "";
  int selectedIndex = -1;
  DateTime? currentTime;
  Timer? timer;
  ButtonData? currentButtonData;

  @override
  void initState() {
    super.initState();
    currentTime = DateTime.now();
    timer =
        Timer.periodic(const Duration(seconds: 1), (Timer t) => updateTime());
  }

  void updateTime() {
    setState(() {
      if (selectedIndex == 1) {
        currentTime = DateTime.now();
      } else {
        currentTime = null;
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  List<ButtonData> buttonDataList = [
    ButtonData(
      title: 'Factory 1',
      gaugeValues: [0.0, 0.0, 0.0, 0.0],
      totalPowerConsumption: 100,
      unreachableTitle: '⚠ ABD1234 IS UNREACHABLE!',
      mainText: 'Factory 1 Main Text',
      gaugeColor: Colors.red,
    ),
    ButtonData(
      title: 'Factory 2',
      gaugeValues: [34.19, 22.82, 55.41, 50.08],
      totalPowerConsumption: 200,
      unreachableTitle: '1549.7kW',
      mainText: 'Factory 2 Main Text',
      gaugeColor: Colors.green,
    ),
    ButtonData(
      title: 'Factory 3',
      gaugeValues: [0.0, 0.0, 0.0, 0.0],
      totalPowerConsumption: 300,
      unreachableTitle: '⚠ ABD1235 IS UNREACHABLE!',
      mainText: 'Factory 3 Main Text',
      gaugeColor: Colors.blue,
    ),
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
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                color: Colors.white,
                child: Row(
                  children: [
                    const Spacer(),
                    Text(
                      title,
                      key: Key('dashboardTitle'),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 42, // Adjusted font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Expanded(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Icon(Icons.settings,
                              color: Colors.blueGrey, size: 35.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: LayoutBuilder(builder: (context, constraints) {
                        return Center(
                            child: Container(
                              width: constraints.maxWidth,
                              height: 580,
                              padding: const EdgeInsets.all(0.0),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
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
                                  Column(
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        currentButtonData?.unreachableTitle ?? '',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold,
                                          fontSize: fontSize, // Adjusted font size
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Gauge(
                                            value: currentButtonData?.gaugeValues[0]
                                                .toDouble() ??
                                                0.0,
                                            mainText: (currentButtonData
                                                ?.gaugeValues[0]
                                                .toDouble() ??
                                                0.0)
                                                .toStringAsFixed(1),
                                            topAnnotation: 'Steam Pressure',
                                            superScript: 'bar',
                                            colorIndex: 1,
                                          ),
                                          Gauge(
                                            value: currentButtonData?.gaugeValues[1]
                                                .toDouble() ??
                                                0.0,
                                            mainText: (currentButtonData
                                                ?.gaugeValues[1]
                                                .toDouble() ??
                                                0.0)
                                                .toStringAsFixed(1),
                                            topAnnotation: 'Steam Flow',
                                            superScript: 'T/H',
                                            colorIndex: 0,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Gauge(
                                            value: currentButtonData?.gaugeValues[2]
                                                .toDouble() ??
                                                0.0,
                                            mainText: (currentButtonData
                                                ?.gaugeValues[2]
                                                .toDouble() ??
                                                0.0)
                                                .toStringAsFixed(1),
                                            topAnnotation: 'Water Level',
                                            superScript: '%',
                                            colorIndex: 1,
                                          ),
                                          Gauge(
                                            value: currentButtonData?.gaugeValues[3]
                                                .toDouble() ??
                                                0.0,
                                            mainText: (currentButtonData
                                                ?.gaugeValues[3]
                                                .toDouble() ??
                                                0.0)
                                                .toStringAsFixed(1),
                                            topAnnotation: 'Power Frequency',
                                            superScript: 'Hz',
                                            colorIndex: 1,
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        selectedIndex == 1 && currentTime != null
                                            ? DateFormat('yyyy-MM-dd HH:mm:ss').format(currentTime!)
                                            : '--.--',
                                        style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold), // Adjusted font size
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ));
                      }),
                    ),
                  ],
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
            )
          ],
        ),
      ),
    );
  }
}