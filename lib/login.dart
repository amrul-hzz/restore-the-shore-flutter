import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:restore_the_shore_flutter/nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:restore_the_shore_flutter/main.dart';
import 'package:restore_the_shore_flutter/register.dart';
import 'package:restore_the_shore_flutter/nav_bar.dart';

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
        title: const Text('Login'),
      ),
      bottomNavigationBar: const NavBar(), 
      body: Form(
        key: _loginFormKey,
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Image(image: AssetImage("lib/assets/Logo2.png")),
              TextFormField(
                onSaved: (input) => _username = input,
                decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                onSaved: (input) => _password = input,
                decoration: InputDecoration(labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                child: Text('Submit'),
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
                        NavBarState.selectedIndex = 0;
                        Navigator.pushReplacementNamed(context, 'home');

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
                                  const Center(child: Text('Tidak Berhasil')),
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
                }
            
            ),

            TextButton(
              child: const Text('Belum mempunyai akun?'),
              onPressed: () {
                Navigator.push(context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterPage()                                
                                ),
                );
              }
            )
          ],
        ),
      ),
    )
    );
  }
}