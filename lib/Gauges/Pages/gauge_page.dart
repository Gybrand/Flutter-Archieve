import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class GaugeIndicators extends StatefulWidget {
  const GaugeIndicators({super.key});

  @override
  State<GaugeIndicators> createState() => _GaugeIndicatorsState();
}

class _GaugeIndicatorsState extends State<GaugeIndicators> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 500,
          width: 500,
          child: SfRadialGauge(axes: <RadialAxis>[
            RadialAxis(
                showLastLabel: true,
                axisLineStyle: AxisLineStyle(
                  cornerStyle: CornerStyle.bothCurve,
                  thickness: 0.15,
                  thicknessUnit: GaugeSizeUnit.factor,
                  color: Colors.grey[300],
                ),
                labelsPosition: ElementsPosition.outside,
                ticksPosition: ElementsPosition.outside,
                minimum: 10,
                maximum: 50,
                pointers: <GaugePointer>[
                  RangePointer(
                    width: 30,
                    cornerStyle: CornerStyle.bothCurve,
                    value: 25,
                    enableAnimation: true,
                    animationType: AnimationType.bounceOut,
                    gradient: SweepGradient(colors: <Color>[
                      Color.fromARGB(255, 0, 0, 0),
                      Colors.black
                    ]),
                  )
                ],
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                      widget: Column(
                        children: [
                          Text('25°C',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      angle: 88,
                      positionFactor: .9)
                ])
          ]),
        ),
      ),
    );
  }
}
