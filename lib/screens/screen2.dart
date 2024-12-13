import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:prueba_001/screens/screen3.dart';
import 'package:prueba_001/screens/screen4.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    Future<void> login() async {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Inicio de sesión exitoso!")),
        );
        navegar4(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: ${e.toString()}")),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Iniciar Sesión"),
        backgroundColor: Colors.blue.shade800, 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Bienvenido a OverMedical",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Inicia sesión para acceder a nuestros servicios o agender una cita.",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 24),
     
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Correo electrónico",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
      
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: "Contraseña",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24),
        
            ElevatedButton(
              onPressed: login, 
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.blue.shade800, 
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Iniciar Sesión",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),
  
            TextButton(
              onPressed: () => navegar3(context),
              child: const Text(
                "¿No tienes cuenta? Regístrate",
                style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void navegar3(context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const Registro()),
  );
}

void navegar4(context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const Citas()),
  );
}
