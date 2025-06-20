import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proxpert_garage_frontend/main.dart';
import 'package:proxpert_garage_frontend/screens/dashboardScreen.dart';
import 'package:proxpert_garage_frontend/screens/mainScreen.dart';
import 'package:proxpert_garage_frontend/screens/services/EmployeeService.dart';

import '../controllers/menu_app_controller.dart'; // Usa la misma instancia desde aquí

class formularioIniciarSesion extends StatelessWidget {
  const formularioIniciarSesion({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              themeNotifier.value = themeNotifier.value == ThemeMode.light
                  ? ThemeMode.dark
                  : ThemeMode.light;
            },
          ),
        ],
      ),
      body: Center(
        child: isSmallScreen
            ? const Column(
                mainAxisSize: MainAxisSize.min,
                children: [_Logo(), _FormContent()],
              )
            : Container(
                padding: const EdgeInsets.all(32.0),
                constraints: const BoxConstraints(maxWidth: 800),
                child: const Row(
                  children: [
                    Expanded(child: _Logo()),
                    Expanded(child: Center(child: _FormContent())),
                  ],
                ),
              ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          Theme.of(context).brightness == Brightness.dark
              ? 'assets/logos/logoTallerBlanco.png'
              : 'assets/logos/logoTallerNegro.png',
          width: isSmallScreen ? 300 : 400,
          fit: BoxFit.fitWidth,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Bienvenido a ProXpert Garage!",
            textAlign: TextAlign.center,
            style: isSmallScreen
                ? Theme.of(context).textTheme.titleLarge
                : Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}

class _FormContent extends StatefulWidget {
  const _FormContent();

  @override
  State<_FormContent> createState() => __FormContentState();
}

class __FormContentState extends State<_FormContent> {
  bool _isPasswordVisible = false;
  final TextEditingController _usernameController = TextEditingController(text: "rrodes");
  final TextEditingController _passwordController = TextEditingController(text: "Pass1234!");

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 300),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _usernameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, introduce tu email o nombre de usuario';
                }

                final emailRegex = RegExp(
                  r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
                );

                final usernameRegex = RegExp(
                  r"^[a-zA-Z0-9._-]{3,}$", // mínimo 3 caracteres
                );

                if (value.contains('@')) {
                  if (!emailRegex.hasMatch(value)) {
                    return 'El correo no tiene un formato válido';
                  }
                } else {
                  if (!usernameRegex.hasMatch(value)) {
                    return 'El nombre de usuario debe tener al menos 3 caracteres válidos';
                  }
                }

                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Email o Username',
                hintText: 'Intoruduzca su email o nombre de usuario',
                prefixIcon: Icon(Icons.email_outlined),
                border: OutlineInputBorder(),
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 16,
                ),
                errorMaxLines: 2,
                errorStyle: TextStyle(fontSize: 13)
              ),
            ),
            _gap(),
            TextFormField(
              controller: _passwordController,
              validator: (value) {
                final errors = <String>[];

                if (value == null || value.isEmpty) {
                  return 'Por favor, ingresa una contraseña';
                }

                if (value.length < 8) {
                  return 'La contraseña debe tener al menos 8 caracteres';
                }
                if (!RegExp(r'[A-Z]').hasMatch(value)) {
                  errors.add('una letra mayúscula');
                }

                if (!RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(value)) {
                  errors.add('un carácter especial');
                }

                if (errors.isNotEmpty) {
                  return 'La contraseña debe contener ${errors.join(', ')}.';
                }

                return null;
              },
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                hintText: 'Intoruduzca su contraseña',
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 16,
                ),
                errorMaxLines: 2,
                errorStyle: TextStyle(fontSize: 13),
                prefixIcon: const Icon(Icons.lock_outline_rounded),
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
            ),
            _gap(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('Iniciar sesión', style: TextStyle(fontSize: 16)),
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final usernameOrEmail = _usernameController.text.trim();
                    final password = _passwordController.text.trim();

                    final empleat = await EmpleatService.ferLogin(
                      usernameOrEmail,
                      password,
                    );

                    if (empleat != null) {
                      // Mostrar spinner durante 10 segundos para simular la generación del token
                      showDialog(
                        context: context,
                        barrierDismissible: false, // No se puede cerrar tocando fuera
                        builder: (context) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      );

                      await Future.delayed(const Duration(seconds: 10));
                      if (context.mounted) Navigator.of(context).pop(); // Cierra el spinner

                      // Ahora navegar a la app principal
                      if (context.mounted) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MultiProvider(
                              providers: [
                                ChangeNotifierProvider(
                                  create: (_) => MenuAppController(),
                                ),
                              ],
                              child: MainScreen(child: DashboardScreen()),
                            ),
                          ),
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Usuario o contraseña incorrectos"),
                        ),
                      );
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _gap() => const SizedBox(height: 16);
}
