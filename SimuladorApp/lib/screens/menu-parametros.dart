import 'package:Simulador/screens/simulador.dart';
import 'package:Simulador/widgets/incrementable.dart';
import 'package:Simulador/widgets/particle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MenuParametros extends StatefulWidget {
  static const routeName = 'screens/simulador';
  @override
  _MenuParametrosState createState() => _MenuParametrosState();
}

enum Sentidos { Positivo, Negativo }

class _MenuParametrosState extends State<MenuParametros> {
  final direccionController = TextEditingController();
  final List<Sentidos> _sentidos = [Sentidos.Positivo, Sentidos.Negativo];
  Sentidos _sentidoValue = Sentidos.Positivo;
  Particula _selectedParticle = Particula.Electron;

  _changeSelectedParticle(Particula particula) {
    setState(() {
      _selectedParticle = particula;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text('Parametros de simulación'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10, right: 10, left: 10),
              child: Card(
                elevation: 5,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black),
                      ),
                      child: TextFormField(
                        // keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp("[0-9.e-]"))
                        ],
                        decoration: InputDecoration(
                            hintText: 'Velocidad inicial de la particula (m/s)',
                            border: InputBorder.none),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Incrementable(90.0, 0, direccionController),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, right: 10, left: 10),
              child: Card(
                elevation: 5,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black),
                      ),
                      child: TextFormField(
                        //keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp("[0-9.e-]"))
                        ],
                        decoration: InputDecoration(
                            hintText: 'Intensidad de campo eléctrico (N/C)',
                            border: InputBorder.none),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text('Sentido:', style: TextStyle(fontSize: 20)),
                          SizedBox(width: 10),
                          DropdownButton<Sentidos>(
                            value: _sentidoValue,
                            icon: Icon(Icons.arrow_drop_down),
                            style: TextStyle(fontSize: 20, color: Colors.black),
                            onChanged: (Sentidos data) {
                              setState(() {
                                _sentidoValue = data;
                              });
                            },
                            items: _sentidos.map<DropdownMenuItem<Sentidos>>(
                                (Sentidos value) {
                              return DropdownMenuItem<Sentidos>(
                                value: value,
                                child: Text(value == Sentidos.Positivo
                                    ? 'Positvo'
                                    : 'Negativo'),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Particle(
                    "Electrón",
                    Particula.Electron,
                    'assets/images/electron.jpg',
                    _selectedParticle,
                    _changeSelectedParticle,
                  ),
                  Particle(
                    "Positrón",
                    Particula.Positron,
                    'assets/images/electron.jpg',
                    _selectedParticle,
                    _changeSelectedParticle,
                  ),
                  Particle(
                    "Protón",
                    Particula.Proton,
                    'assets/images/electron.jpg',
                    _selectedParticle,
                    _changeSelectedParticle,
                  ),
                  Particle(
                    "Neutrón",
                    Particula.Neutron,
                    'assets/images/electron.jpg',
                    _selectedParticle,
                    _changeSelectedParticle,
                  ),
                  Particle(
                    "Particula Alfa",
                    Particula.ParticulaAlfa,
                    'assets/images/electron.jpg',
                    _selectedParticle,
                    _changeSelectedParticle,
                  ),
                 /* Particle(
                    "Nucleo de Deuterio",
                    Particula.NucleoDeuterio,
                    'assets/images/electron.jpg',
                    _selectedParticle,
                    _changeSelectedParticle,
                  ),
                  Particle(
                    "Muón",
                    Particula.Muon,
                    'assets/images/electron.jpg',
                    _selectedParticle,
                    _changeSelectedParticle,
                  ),*/
                ],
              ),
            ),
            SizedBox(height: 10),
            RaisedButton(
              color: Colors.green[800],
              child: Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  'Simular',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Simulador()));
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
