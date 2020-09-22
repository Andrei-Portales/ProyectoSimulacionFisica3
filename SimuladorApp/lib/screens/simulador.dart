import 'package:Simulador/screens/menu-parametros.dart';
import 'package:csv/csv.dart';
import 'dart:convert';
import 'dart:html';
import '../widgets/line-chart.dart';
import 'package:flutter/material.dart';

class Simulador extends StatefulWidget {
  final double velocidadInicial;
  final double grados;
  final double intensidadCampo;
  final Sentidos sentidoCampo;
  final Map<String, dynamic> datosParticula;
  final int puntos;

  Simulador({
    @required this.velocidadInicial,
    @required this.grados,
    @required this.intensidadCampo,
    @required this.sentidoCampo,
    @required this.datosParticula,
    @required this.puntos,
  });

  @override
  _SimuladorState createState() => _SimuladorState();
}

class _SimuladorState extends State<Simulador> {
  bool _download = false;
  List<List<dynamic>> data;

  /// FUncion para cambiar el set de datos
  setData(List data) {
    this.data = data;
  }

  /// Cambiar de estado para descargar
  changeDownload() {
    setState(() {
      _download = true;
    });
  }

  /// Funcion para transformar los datos a csv y descargarlos
  _downloadFunction() {
    String csv = const ListToCsvConverter().convert([
      ['Velocidad incial: ${widget.velocidadInicial} m/s'],
      ['Grados iniciales; ${widget.grados} grados'],
      ['Intensidad del campo: ${widget.intensidadCampo} N/C'],
      [
        'Sentido del campo: ${widget.sentidoCampo == Sentidos.Positivo ? 'Positivo' : 'Negativo'}'
      ],
      ['Datos de la particula: ${widget.datosParticula}'],
      ['Tiempo: ${widget.puntos} segundos'],
      [],
      ['---------------------------------------------------------------------'],
      [],
      ...data,
    ]);

    final rawData = csv.codeUnits;
    final content = base64Encode(rawData);
    AnchorElement(
        href: "data:application/octet-stream;charset=utf-16le;base64,$content")
      ..setAttribute("download", "${widget.datosParticula['name']}_data.txt")
      ..click();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text('Simulador'),
        actions: [
          if (_download)
            IconButton(
              icon: Icon(
                Icons.file_download,
                color: Colors.white,
              ),
              onPressed: _downloadFunction,
            ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: LineChartSample2(
          velocidadInicial: this.widget.velocidadInicial,
          grados: this.widget.grados,
          intensidadCampo: this.widget.intensidadCampo,
          sentidoCampo: this.widget.sentidoCampo,
          datosParticula: this.widget.datosParticula,
          puntos: this.widget.puntos,
          changeDownload: changeDownload,
          setData: setData,
        ),
      ),
    );
  }
}
