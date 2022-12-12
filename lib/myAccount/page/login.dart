import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:restore_the_shore_flutter/main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();

  String? _username = "";
  String? _password = "";
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    // The rest of your widgets are down below
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Login'),
      ),
      body: Form(
        key: _loginFormKey,
        child: Column(
          children: [
            TextFormField(
              onSaved: (input) => _username = input,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextFormField(
              onSaved: (input) => _password = input,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () async {
                if (_loginFormKey.currentState!.validate()) {
                  _loginFormKey.currentState!.save();
                  final response = await request.login(
                      "https://restore-the-shore.up.railway.app/authentication/login",
                      {
                        'username': _username,
                        'password': _password,
                      });
                  if (request.loggedIn) {
                    // Code here will run if the login succeeded.
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 15,
                          child: Container(
                            child: ListView(
                              padding: const EdgeInsets.all(20.0),
                              shrinkWrap: true,
                              children: <Widget>[
                                Center(child: const Text('Berhasil')),
                                SizedBox(height: 20),
                                Text('Judul : $_username'),
                                Text('Nominal : $_password'),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Kembali'),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    // Code here will run if the login failed (wrong username/password).
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 15,
                          child: Container(
                            child: ListView(
                              padding: const EdgeInsets.all(20.0),
                              shrinkWrap: true,
                              children: <Widget>[
                                Center(child: const Text('Tidak Berhasil')),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Kembali'),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
