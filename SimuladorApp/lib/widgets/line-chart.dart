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
      _spots.clear();
      _cells.clear();

      for (double i = 0; i < 100; i++) {
        await Future.delayed(Duration(milliseconds: 200), () {
          setState(() {
            /* double value = double.parse(cos(i).toStringAsPrecision(3));

            if (value * 2 > maxy) {
              maxy = value * 2;
            }

            if (value * 2 < miny) {
              miny = value * 2;
            }*/

            _spots.add(
              FlSpot(
                UtilFunctions.getX(
                    vox: UtilFunctions.getVox(vo: 20, angle: 30), t: i),
                UtilFunctions.getY(
                  voy: UtilFunctions.getVoy(vo: 20, angle: 30),
                  t: i,
                  a: -9.8,
                ),
              ),
            );
            /*_cells.add(
              DataRow(
                cells: [
                  DataCell(Text('$i')),
                  DataCell(Text('${value.toStringAsPrecision(3)}')),
                ],
              ),
            );*/
          });
        });
      }
      start = false;
    }
  }

  getGraph() {
    double velocidadInicial = widget.velocidadInicial;
    double grados = widget.grados;
    double intensidadCampo = widget.intensidadCampo *
        (widget.sentidoCampo == Sentidos.Positivo ? 1 : -1);
    double masaParticula = widget.datosParticula['mass'];
    double cargaParticula = widget.datosParticula['charge'];


  

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
                  numeric: false,
                ),
                DataColumn(
                  label: Text("Posicion"),
                  numeric: false,
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
          showTitles: false,
          textStyle: TextStyle(color: Colors.white),
        ),
        leftTitles: SideTitles(
          showTitles: false,
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
