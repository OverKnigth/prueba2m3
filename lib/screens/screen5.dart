import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:prueba_001/navegadores/drawer.dart';

class Servicios extends StatefulWidget {
  const Servicios({super.key});

  @override
  State<Servicios> createState() => _ServiciosState();
}

class _ServiciosState extends State<Servicios> {
  List _servicios = [];

  Future<void> _loadServicios() async {
    final String response =
        await rootBundle.loadString('assets/data/servicios.json');
    final data = await json.decode(response);

    setState(() {
      _servicios = data['servicio_medico'];
    });
  }

  @override
  void initState() {
    super.initState();
    _loadServicios();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Servicios Médicos'),
        backgroundColor: Colors.blue, 
      ),
      backgroundColor: Colors.white, 
      drawer: MiDrawer(),
      body: _servicios.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _servicios.length,
              itemBuilder: (context, index) {
                final servicio = _servicios[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                  color: Colors.white,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    title: Text(
                      servicio['nombre'],
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue), 
                    ),
                    subtitle: Text(
                      servicio['descripcion'],
                      style: const TextStyle(color: Colors.black),
                    ),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        servicio['info']['imagen'],
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    onTap: () {
                      _showServicioDetails(servicio, context);
                    },
                  ),
                );
              },
            ),
    );
  }

  void _showServicioDetails(Map servicio, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white, 
          title: Text(
            servicio['nombre'],
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue), 
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(servicio['info']['imagen'], fit: BoxFit.cover),
              const SizedBox(height: 10),
              Text("Descripción: ${servicio['descripcion']}",
                  style: const TextStyle(color: Colors.black)),
              const SizedBox(height: 10),
              Text("Horario: ${servicio['horario']}",
                  style: const TextStyle(color: Colors.black)),
              const SizedBox(height: 10),
              Text("Proveedor: ${servicio['proveedor']['nombre']}",
                  style: const TextStyle(color: Colors.black)),
              const SizedBox(height: 10),
              Text("Precio: ${servicio['info']['precio']}",
                  style: const TextStyle(color: Colors.black)),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cerrar', style: TextStyle(color: Colors.blue)),
            ),
          ],
        );
      },
    );
  }
}
