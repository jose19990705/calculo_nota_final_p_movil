import 'package:flutter/material.dart';

class CalculadoraNotaPage extends StatefulWidget {
  const CalculadoraNotaPage({super.key});

  @override
  State<CalculadoraNotaPage> createState() => _CalculadoraNotaPageState();
}

class _CalculadoraNotaPageState extends State<CalculadoraNotaPage> {
  double _total = 0;

  final _nota_laboratorio = TextEditingController();
  final _nota_primer_avance = TextEditingController();
  final _nota_segundo_avance = TextEditingController();
  final _nota_entrega_final = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .primary,
        title: const Text("Calculadora de nota final"),
      ),
      backgroundColor: Colors.white70,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              Image(
                image: AssetImage("assets/images/logo.png"),
                height: 150,
                width: 150,
              ),

              const SizedBox(height: 20),
              TextFormField(
                controller: _nota_laboratorio,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.edit_note),
                  labelText: "Nota del laboratorio",
                ),
                keyboardType: TextInputType.number,
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: _nota_primer_avance,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.edit_note),
                  labelText: "Nota del primer avance en el proyecto final",
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),

              TextFormField(
                controller: _nota_segundo_avance,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.edit_note),
                  labelText: "Nota del segundo avance en el proyecto final",
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),

              TextFormField(
                controller: _nota_entrega_final,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.edit_note),
                  labelText: "Nota en la entrega final",
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton.icon(onPressed: () {
                _calcular();
              }, label: Text("Calcular"),),
              const SizedBox(
                height: 20.0,
              ),

              Text(
                "La definitiva del curso es: ${_total.toStringAsFixed(1)} ",
                style: const TextStyle(
                    fontSize: 20, fontStyle: FontStyle.italic),
              ),


            ],
          ),
        ),
      ),
    );
  }

//En esta función se hace el cálculo de la nota total
  void _calcular() {

    //Con el objetivo de mejorar la iteracción y ejecución de la aplicación, se procede con validaciones de datos.


    //Se valida que ninguno de los campos este sin llenar
    String labText = _nota_laboratorio.text.trim();
    String avance1Text = _nota_primer_avance.text.trim();
    String avance2Text = _nota_segundo_avance.text.trim();
    String finalText = _nota_entrega_final.text.trim();


    if (labText.isEmpty || avance1Text.isEmpty || avance2Text.isEmpty || finalText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Todos los campos deben estar llenos")),
      );
      return;
    }



    //Se valida la nota, puesto que no se deben ingresar valores mayores a 5.0

    double _notaLaboratorio = double.parse(_nota_laboratorio.text);
    double _notaPrimerAvance = double.parse(_nota_primer_avance.text);
    double _notaSegundoAvance = double.parse(_nota_segundo_avance.text);
    double _notaEntregaFinal = double.parse(_nota_entrega_final.text);

    if ((_notaLaboratorio > 5 || _notaPrimerAvance > 5 ||
        _notaSegundoAvance > 5 || _notaEntregaFinal > 5)||(_notaLaboratorio < 0 || _notaPrimerAvance < 0 ||
        _notaSegundoAvance < 0 || _notaEntregaFinal < 0)) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Ninguna nota puede ser mayor a 5.0, ni menor a 0.0"),));
    }

    else {
      setState(() {
        _total =
            _notaLaboratorio * 0.6 +
                (_notaPrimerAvance +
                    _notaSegundoAvance) *
                    0.1 +
                _notaEntregaFinal * 0.2;
      });
    }
  }
}
