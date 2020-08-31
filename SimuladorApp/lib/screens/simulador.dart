import '../widgets/line-chart.dart';
import 'package:flutter/material.dart';

class Simulador extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text('Simulador'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: LineChartSample2(),
      ),
    );
  }
}
