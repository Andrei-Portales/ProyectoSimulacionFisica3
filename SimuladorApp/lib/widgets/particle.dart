import 'package:flutter/material.dart';

enum Particula {
  Electron,
  Positron,
  Proton,
  Neutron,
  ParticulaAlfa,
  NucleoDeuterio,
  Muon,
  Tauon,
  Meson,
  Lambda,
  Sigma,
}


class Particle extends StatelessWidget {
  String title;
  Particula value;
  String image;
  Particula _selectedParticle;
  Function _changeSelectedParticle;
  Particle(this.title, this.value, this.image, this._selectedParticle,
      this._changeSelectedParticle);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.all(10),
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: (_selectedParticle == value)
              ? Border.all(color: Colors.red, width: 5)
              : Border.all(color: Colors.white, width: 1),
          image: DecorationImage(
            image: AssetImage(this.image),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Container(
              color: Colors.black87,
              padding: EdgeInsets.all(10),
              child: Text(this.title,
                  style: TextStyle(color: Colors.white, fontSize: 25)),
            ),
          ],
        ),
      ),
      onTap: () {
        _changeSelectedParticle(value);
      },
    );
  }
}
