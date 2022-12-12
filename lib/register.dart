import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:restore_the_shore_flutter/nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:restore_the_shore_flutter/main.dart';
import 'dart:developer';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _registerFormKey = GlobalKey<FormState>();

  String? _username = "";
  String? _password = "";
  String? _repeat_password = "";
  
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    // The rest of your widgets are down below
    return Scaffold(
      appBar: AppBar(
        title: Text('Register A New Account'),
      ),
      bottomNavigationBar: const NavBar(), 
      body: Form(
        key: _registerFormKey,
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

            TextFormField(
              onSaved: (input) => _repeat_password = input,
              decoration: InputDecoration(labelText: 'Confirm Your Password'),
              obscureText: true,
            ),

            ElevatedButton(
              child: Text('Submit'),
              onPressed: () async {
                //if (_registerFormKey.currentState!.validate()) {
                  //_registerFormKey.currentState!.save();

                  final response = await request.post(
                      "https://restore-the-shore.up.railway.app/authentication/register/",
                      {
                        'username': _username,
                        'password': _password,
                        'repeat_password': _repeat_password,
                      }
                  );

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
                              Center(child: request.loggedIn 
                                ? const Text('Berhasil Mendaftarkan Akun')
                                : Text('${response.message}')
                              ),

                              SizedBox(height: 20),

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
               
            ),
          ],
        ),
      ),
    );
  }
}
