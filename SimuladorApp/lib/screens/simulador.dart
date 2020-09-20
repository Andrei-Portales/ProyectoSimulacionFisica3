import 'package:Simulador/screens/menu-parametros.dart';

import '../widgets/line-chart.dart';
import 'package:flutter/material.dart';

class Simulador extends StatelessWidget {
  final double velocidadInicial;
  final double grados;
  final double intensidadCampo;
  final Sentidos sentidoCampo;
  final Map<String, double> datosParticula;

  Simulador({
    @required this.velocidadInicial,
    @required this.grados,
    @required this.intensidadCampo,
    @required this.sentidoCampo,
    @required this.datosParticula,
  });

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
        child: LineChartSample2(
          velocidadInicial: this.velocidadInicial,
          grados: this.grados,
          intensidadCampo: this.intensidadCampo,
          sentidoCampo: this.sentidoCampo,
          datosParticula: this.datosParticula,
        ),
      ),
    );
  }
}
