import 'package:Simulador/widgets/particle.dart';

class ParticlesData {
  static const Map<Particula, Map<String, double>> data = {
    Particula.Electron: {'mass': 9.10938291e-31, 'charge': 1.602176565e-19},
    Particula.Positron:{'mass': 9.10938215e-31, 'charge': 1.602176487e-19},
    Particula.Proton:{'mass': 1.672621898e-27, 'charge': 1.602176487e-19},
    Particula.Neutron:{'mass': 1.67492729e-27, 'charge': 0.0},
    Particula.ParticulaAlfa:{'mass': 1.24889063e-11, 'charge': 1.602e-19},
    /*Particula.NucleoDeuterio:{'mass': 6.28607768e-12, 'charge': 1.602e-19 /* No encontre la cargar real, use la de la particula alfa*/ },
    Particula.Muon:{'mass': , 'charge': },*/
  };
}
