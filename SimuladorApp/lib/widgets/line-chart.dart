import 'package:Simulador/screens/menu-parametros.dart';
import 'package:Simulador/util/functions.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class LineChartSample2 extends StatefulWidget {
  final double velocidadInicial;
  final double grados;
  final double intensidadCampo;
  final Sentidos sentidoCampo;
  final Map<String, double> datosParticula;
  LineChartSample2({
    @required this.velocidadInicial,
    @required this.grados,
    @required this.intensidadCampo,
    @required this.sentidoCampo,
    @required this.datosParticula,
  });
  @override
  _LineChartSample2State createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> gradientColors = [Colors.white];
  List<FlSpot> _spots = [
    FlSpot(0, 0),
  ];
  bool start = false;

  List<DataRow> _cells = [];
  double maxy = 0.0;
  double miny = 0.0;

  /// Metodo para poder agregar los puntos a la grafica
  _addDots() async {
    if (!start) {
      start = true;
      _cells.clear();

      setState(() {
        _spots = getGraph();
      });

      start = false;
    }
  }

  List<FlSpot> getGraph() {
    double velocidadInicial = widget.velocidadInicial;
    double grados = widget.grados;
    double intensidadCampo = widget.intensidadCampo *
        (widget.sentidoCampo == Sentidos.Positivo ? 1 : -1);
    double masaParticula = widget.datosParticula['mass'];
    double cargaParticula = widget.datosParticula['charge'];

    double velocidadx;
    double velocidady;
    double aceleracion;
    double radianes;
    double y;
    
    List<FlSpot> puntos = []; /// El error era que esta lista solo la habias declarado pero no inicializado

    radianes = (pi * grados) / 180;

    velocidadx = velocidadInicial * cos(radianes);
    velocidady = velocidadInicial * sin(radianes);
    aceleracion = (cargaParticula * intensidadCampo) / masaParticula;

    for (double i = 0; i < 10; i++) {
      y = (velocidady / velocidadx) * i -
          0.5 * (aceleracion / (velocidadx * velocidadx)) * (i * i);

      puntos.add(FlSpot(i, y));
    }

    return puntos;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
            width: double.infinity,
            padding: EdgeInsets.all(15),
            child: LineChart(mainData()),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RaisedButton(
                child: Text('Start'),
                onPressed: _addDots,
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: DataTable(
              columns: [
                DataColumn(
                  label: Text("Tiempo"),
                  numeric: true,
                ),
                DataColumn(
                  label: Text("Posicion"),
                  numeric: true,
                ),
              ],
              rows: _cells,
            ),
          ),
        ],
      ),
    );
  }

  LineChartData mainData() {
    return LineChartData(
      //maxY: maxy,
      // minY: miny,
      backgroundColor: Colors.white,
      titlesData: FlTitlesData(
        bottomTitles: SideTitles(
          showTitles: true,
          textStyle: TextStyle(color: Colors.white),
        ),
        leftTitles: SideTitles(
          showTitles: true,
          textStyle: TextStyle(color: Colors.white),
        ),
      ),
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Colors.grey,
            strokeWidth: 0.4,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: Colors.grey,
            strokeWidth: 0.4,
          );
        },
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      lineBarsData: [
        LineChartBarData(
          spots: _spots,
          isCurved: true,
          colors: [Colors.black],
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
        ),
      ],
    );
  }
}
