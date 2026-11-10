import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final String correctEmail = "pepe@yahoo.es";
  final String correctPass = "pepeyahoo";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text(
                      "Iniciar Sesión",
                      style: TextStyle(
                        fontSize: 22.0, // Tamaño de fuente
                        fontWeight: FontWeight.bold, // Texto en negrita
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(children: [creaCampoEmail()]),
                    SizedBox(height: 20),
                    Row(children: [creaCampoPassword()]),
                    SizedBox(height: 20),
                    creaBotonSubmit(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // Inicializamos el texto del controlador
    _emailController.text = "";
    _passwordController.text = "";
  }

  @override
  void dispose() {
    // Liberamos el controlador cuando el widget se elimine
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Expanded creaCampoEmail() {
    return Expanded(
      child: TextFormField(
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'No puede estar vacío';
          }
          final regexCorreo = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

          // Validación del correo con la expresión regular
          if (!regexCorreo.hasMatch(value ?? "")) {
            return 'La dirección de correo no es válida';
          }
          return null;
        },
        controller: _emailController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          icon: const Icon(Icons.email),
          labelText: 'Correo Electrónico',
        ),
      ),
    );
  }

  Expanded creaCampoPassword() {
    return Expanded(
      child: TextFormField(
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'No puede estar vacío';
          }
          return null;
        },
        controller: _passwordController,
        keyboardType: TextInputType.text,
        obscureText: true,
        obscuringCharacter: "*",
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          icon: const Icon(Icons.lock),
          labelText: 'Contraseña',
        ),
      ),
    );
  }

  ElevatedButton creaBotonSubmit() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState?.validate() ?? false) {
          if (_emailController.text == correctEmail &&
              _passwordController.text == correctPass) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/continentes',
              (Route<dynamic> route) => false,
            );
          } else {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Error"),
                  content: const Text("El usuario o la contraseña son incorrectas."),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, "Volver");
                      },
                      child: const Text("Volver"),
                    ),
                    TextButton(
                      onPressed: () {
                        _emailController.text = correctEmail;
                        _passwordController.text = correctPass;
                        Navigator.pop(context, "Volver");
                      },
                      child: const Text("Rellenar usuario"),
                    ),
                  ],
                );
              },
            );
          }
        }
      },
      child: const Text("Iniciar sesión"),
    );
  }
}
