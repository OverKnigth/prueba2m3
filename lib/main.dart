import 'package:flutter/material.dart';
import 'package:prueba_001/screens/screen2.dart';
import 'package:prueba_001/screens/screen3.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Prueba());
}

class Prueba extends StatelessWidget {
  const Prueba({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Cuerpo(),
    );
  }
}

class Cuerpo extends StatelessWidget {
  const Cuerpo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo
          Positioned.fill(
            child: Image.network(
              "https://i.pinimg.com/236x/ec/76/b6/ec76b61ac767699fabba98c92074e977.jpg",
              fit: BoxFit.cover,
            ),
          ),
          // Contenido
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Texto superior
                const Padding(
                  padding: EdgeInsets.only(bottom: 24.0),
                  child: Text(
                    "OverMedical",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      shadows: [
                        Shadow(
                          offset: Offset(3.0, 3.0),
                          blurRadius: 4.0,
                          color: Colors.black26,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                // Nombre
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "Nombre: Stalin Moposita",
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.black,
                      shadows: [
                        Shadow(
                          offset: Offset(1.5, 1.5),
                          blurRadius: 3.0,
                          color: Colors.black26,
                        ),
                      ],
                    ),
                  ),
                ),
                // GitHub
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "GitHub: OverKnigth",
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.black,
                      shadows: [
                        Shadow(
                          offset: Offset(1.5, 1.5),
                          blurRadius: 3.0,
                          color: Colors.black26,
                        ),
                      ],
                    ),
                  ),
                ),
                // Botón de login
                login_btn(context),
                const SizedBox(height: 16),
                // Botón de registro
                regis_btn(context),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget login_btn(context) {
  return ElevatedButton.icon(
    onPressed: () => navegar2(context),
    label: const Text(
      "Iniciar Sesión",
      style: TextStyle(fontSize: 18),
    ),
    icon: const Icon(Icons.login_rounded),
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blue.shade800,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      elevation: 6,
    ),
  );
}

Widget regis_btn(context) {
  return ElevatedButton.icon(
    onPressed: () => navegar3(context),
    label: const Text(
      "Registrarse",
      style: TextStyle(fontSize: 18),
    ),
    icon: const Icon(Icons.app_registration_rounded),
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.cyanAccent.shade700,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      elevation: 6,
    ),
  );
}

void navegar2(context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const Login()),
  );
}

void navegar3(context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const Registro()),
  );
}
