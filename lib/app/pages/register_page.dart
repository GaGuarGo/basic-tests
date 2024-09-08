import 'package:flutter/material.dart';
import 'package:flutter_unit_tests_app/app/shared/auth/auth_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  final _auth = Auth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conceitos de Testes'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              key: const Key('email_key'),
              controller: emailEC,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  hintText: 'E-mail',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)))),
            ),
            const SizedBox(height: 16),
            TextFormField(
              key: const Key('password_key'),
              controller: passwordEC,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              decoration: const InputDecoration(
                  hintText: 'Senha',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)))),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              key: const Key('register_button_key'),
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 26),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16))),
              onPressed: () {
                final String? result = _auth.register(
                    email: emailEC.text, password: passwordEC.text);

                if (result != null) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(
                        result,
                        style: const TextStyle(color: Colors.white),
                      )));
                }
              },
              child: const Text("REGISTRAR"),
            )
          ],
        ),
      ),
    );
  }
}
