import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyForm(),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Color buttonColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Boutton action'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child:  Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Mot de passe'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un mot de passe';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Confirmer le mot de passe'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez confirmer votre mot de passe';
                  } else if (value != passwordController.text) {
                    return 'Les mots de passe ne correspondent pas';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    buttonColor = value == passwordController.text ? Colors.orange : Colors.grey;
                  });
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: buttonColor == Colors.orange
                    ? () {
                        // Effectuez l'action souhaitée lorsque le bouton est activé
                        if (_formKey.currentState?.validate() ?? false) {
                          // Le formulaire est valide, une autre action
                          print('Formulaire valide');
                        }
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                ),
                child: Text('Valider'),
              ),
            ],
          ),
        )
        ),
      ),
    );
  }
}

