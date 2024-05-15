import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Gauge extends StatelessWidget {
  Gauge({
    Key? key,
    required this.value,
    required this.mainText,
    required this.topAnnotation,
    required this.superScript,
    required this.colorIndex, // Add a colorIndex parameter
  }) : super(key: key);

  final double value;
  final String mainText;
  final String topAnnotation;
  final String superScript;
  final int colorIndex; // Add a colorIndex field

  // Define a list of colors
  final List<Color> gaugeColors = [
    Colors.red,
    Colors.green,
    Colors.yellow,
  ];

  Color getGaugeColor() {
    // Use the colorIndex to select a color from the list
    return gaugeColors[colorIndex % gaugeColors.length];
  }

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      return Container(
        width: 190,
        height: 210,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Stack(
            children: [
              SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    startAngle: 180,
                    endAngle: 0,
                    interval: 25,
                    minorTicksPerInterval: 0,
                    minimum: 0,
                    maximum: 100,
                    canScaleToFit: true,
                    majorTickStyle: const MajorTickStyle(length: 10),
                    labelFormat: '',
                    axisLineStyle: const AxisLineStyle(
                      thickness: 22, // Set the color of the full bar to grey
                    ),
                    pointers: <GaugePointer>[
                      RangePointer(
                        value: value,
                        width: 22,
                        color: getGaugeColor(), // Use the getGaugeColor function here
                      ),
                      MarkerPointer(
                        value: value,
                        markerOffset: -15,
                        markerHeight: 15,
                        markerWidth: 15, // Set the color of the marker to black
                      ),
                    ],
                  ),
                ],
              ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(top: 2.0),
                        child: Text(
                          topAnnotation,
                          style: const TextStyle(
                              fontSize: 17, fontFamily: 'Poppins'),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              mainText,
                              style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins'),
                            ),
                            Text(
                              superScript,
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins'),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      );
}
