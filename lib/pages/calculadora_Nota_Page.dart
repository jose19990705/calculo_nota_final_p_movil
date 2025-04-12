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
        backgroundColor: Theme.of(context).colorScheme.primary,
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
              ElevatedButton.icon(onPressed: (){_calcular();},label: Text("Calcular"),),
              const SizedBox(
                height: 20.0,
              ),

              Text(
                "La definitiva del curso es: ${_total.toStringAsFixed(1)} ",
                style: const TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
              ),


            ],
          ),
        ),
      ),
    );
  }
//En esta función se hace el cálculo de la nota total
  void _calcular() {

    setState(() {
      _total =
          double.parse(_nota_laboratorio.text) * 0.6 +
          (double.parse(_nota_primer_avance.text) +
                  double.parse(_nota_segundo_avance.text)) *
              0.1 +
          double.parse(_nota_entrega_final.text) * 0.2;
    });
  }
}
