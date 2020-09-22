import 'package:Simulador/widgets/particle.dart';

/// Esta clase contiene toda la informacion de las particulas que se
/// utilizaran en el programa, con su masa y su carga electrica

class ParticlesData {
  static const Map<Particula, Map<String, dynamic>> data = {
    Particula.Electron: {
      'mass': 9.10938291e-31,
      'charge': -1.602176565e-19,
      'name': 'Electron',
    },
    Particula.Positron: {
      'mass': 9.10938215e-31,
      'charge': 1.602176487e-19,
      'name': 'Positron',
    },
    Particula.Proton: {
      'mass': 1.672621898e-27,
      'charge': 1.602176487e-19,
      'name': 'Proton',
    },
    Particula.Neutron: {
      'mass': 1.67492729e-27,
      'charge': 0.0,
      'name': 'Neutron',
    },
    Particula.ParticulaAlfa: {
      'mass': 1.24889063e-11,
      'charge': 1.602e-19,
      'name': 'Particula Alfa',
    },
    Particula.Muon: {
      'mass': 1.883531627e-28,
      'charge': -1.602176565e-19,
      'name': 'Muon',
    },
    Particula.Tauon: {
      'mass': 3.16754e-27,
      'charge': -1.602176565e-19,
      'name': 'Tauon',
    },
    Particula.Meson: {
      'mass': 3.16754e-27,
      'charge': 1.602176565e-19,
      'name': 'Meson',
    },
    Particula.Lambda: {
      'mass': 1.99764e-30,
      'charge': 0,
      'name': 'Lambda',
    },
    Particula.Sigma: {
      'mass': 2.12831,
      'charge': 1.602176565e-19,
      'name': 'Sigma',
    },
  };
}
