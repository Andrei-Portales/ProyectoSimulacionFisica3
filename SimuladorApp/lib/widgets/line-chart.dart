import 'package:Simulador/screens/menu-parametros.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class LineChartSample2 extends StatefulWidget {
  final double velocidadInicial;
  final double grados;
  final double intensidadCampo;
  final Sentidos sentidoCampo;
  final Map<String, dynamic> datosParticula;
  final int puntos;
  final Function changeDownload;
  Function setData;

  LineChartSample2({
    @required this.velocidadInicial,
    @required this.grados,
    @required this.intensidadCampo,
    @required this.sentidoCampo,
    @required this.datosParticula,
    @required this.puntos,
    @required this.changeDownload,
    @required this.setData,
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
  double _maxX = 1;
  double _minX = -1;
  double _maxY = 1;
  double _minY = -1;

  List<DataRow> _cells = [];
  

  /// Metodo para poder agregar los puntos a la grafica
  _addDots() async {
    if (!start) {
      start = true;
      _cells.clear();

      setState(() {
        final dots = getGraph();
        _spots = dots;
        _cells = dots
            .map((e) => DataRow(cells: [
                  DataCell(SelectableText('${e.x.toStringAsPrecision(3)}')),
                  DataCell(SelectableText('${e.y.toStringAsPrecision(3)}')),
                ]))
            .toList();
      });
      this.widget.changeDownload();
      start = false;
    }
  }

  /// Metodo para calcular todos los puntos de la grafica para la trayectoria
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
    double x;

    List<FlSpot> puntos = [];

    radianes = (pi * grados) / 180;

    velocidadx = velocidadInicial * cos(radianes);
    velocidady = velocidadInicial * sin(radianes);
    aceleracion = (cargaParticula * intensidadCampo) / masaParticula;

    for (double i = -widget.puntos.toDouble(); i <= widget.puntos; i++) {
      //y = (velocidady / velocidadx) * i -
      //  0.5 * (aceleracion / (velocidadx * velocidadx)) * (i * i);

      if (grados == 90) {
        x = 0;
        y = velocidady * i - 0.5 * aceleracion * (i * i);
      } else if (grados == 0) {
        x = velocidadx * i;
        y = 0;
      } else {
        x = velocidadx * i;
        y = velocidady * i - 0.5 * aceleracion * (i * i);
      }

      if (x > _maxX) {
        _maxX = x + 1;
      }

      if (x < _minX) {
        _minX = x - 1;
      }

      if (y > _maxY) {
        _maxY = y + 1;
      }

      if (y < _minY) {
        _minY = y - 1;
      }

      puntos.add(FlSpot(double.parse(x.toStringAsPrecision(3)),
          double.parse(y.toStringAsPrecision(3))));

      widget.setData(puntos
          .map((e) => [e.x.toStringAsPrecision(3), e.y.toStringAsPrecision(3)])
          .toList());
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
            height: 500,
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: SingleChildScrollView(
              child: DataTable(
                columns: [
                  DataColumn(
                    label: Text("Posicion 'X'"),
                    numeric: true,
                  ),
                  DataColumn(
                    label: Text("Posicion 'Y'"),
                    numeric: true,
                  ),
                ],
                rows: _cells,
              ),
            ),
          ),
        ],
      ),
    );
  }

  LineChartData mainData() {
    return LineChartData(
      maxX: _maxX,
      minX: _minX,
      maxY: _maxY,
      minY: _minY,
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
