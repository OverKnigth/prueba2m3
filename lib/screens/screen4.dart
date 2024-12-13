import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:prueba_001/navegadores/drawer.dart';

class Citas extends StatelessWidget {
  const Citas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Citas"),
        backgroundColor: Colors.blue.shade800,
      ),
      drawer: MiDrawer(),
      body: formulario(context),
    );
  }
}

Widget formulario(BuildContext context) {
  TextEditingController idCita = TextEditingController();
  TextEditingController especialidad = TextEditingController();
  TextEditingController dia = TextEditingController();

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Citas",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade800),
            textAlign: TextAlign.center),
        Text("Agenda tu cita con nosotros y mejora tu salud.",
            style: TextStyle(fontSize: 16, color: Colors.blue.shade800),
            textAlign: TextAlign.center),
        SizedBox(height: 24),
        TextField(
          controller: idCita,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            label: Text('ID de la Cita',
                style: TextStyle(color: Colors.blue.shade800)),
          ),
        ),
        SizedBox(height: 16),
        TextField(
          controller: especialidad,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            label: Text('Especialidad',
                style: TextStyle(color: Colors.blue.shade800)),
          ),
        ),
        SizedBox(height: 16),
        TextField(
          controller: dia,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            label: Text('Día', style: TextStyle(color: Colors.blue.shade800)),
          ),
        ),
        SizedBox(height: 24),
        Center(
          child: ElevatedButton(
            onPressed: () =>
                guardar(context, idCita.text, especialidad.text, dia.text),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              backgroundColor: Colors.blue.shade800,
            ),
            child: Text('Guardar Cita',
                style: TextStyle(fontSize: 16, color: Colors.white)),
          ),
        ),
      ],
    ),
  );
}

Future<void> guardar(BuildContext context, String idCita, String especialidad,
    String dia) async {
  if (idCita.isEmpty || especialidad.isEmpty || dia.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Por favor, completa todos los campos")),
    );
    return;
  }

  DatabaseReference ref = FirebaseDatabase.instance.ref("citas/" + idCita);

  await ref.set({
    "id": idCita,
    "especialidad": especialidad,
    "dia": dia,
  });

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text("Cita guardada exitosamente")),
  );
}
