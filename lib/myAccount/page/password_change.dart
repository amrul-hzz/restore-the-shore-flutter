import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:restore_the_shore_flutter/colorpalette.dart';

class MyPasswordFormPage extends StatefulWidget {
  const MyPasswordFormPage({super.key});

  @override
  State<MyPasswordFormPage> createState() => _MyPasswordFormPageState();
}

class _MyPasswordFormPageState extends State<MyPasswordFormPage> {
  final _passwordFormKey = GlobalKey<FormState>();
  String? _oldPassword = "";
  String? _newPassword1 = "";
  String? _newPassword2 = "";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text('Change Password'),
      ),
      body: Form(
        key: _passwordFormKey,
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Text input old password
              Padding(
                // Menggunakan padding sebesar 8 pixels
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: "Insert old password",
                    labelText: "Old Password",
                    // Menambahkan circular border agar lebih rapi
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  // Menambahkan behavior saat data disimpan
                  onChanged: (String? value) {
                    setState(() {
                      _oldPassword = value!;
                    });
                  },
                  onSaved: (String? value) {
                    setState(() {
                      _oldPassword = value!;
                    });
                  },
                  // Validator sebagai validasi form
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your old password!';
                    }
                    return null;
                  },
                ),
              ),

              // Text input new password
              Padding(
                // Menggunakan padding sebesar 8 pixels
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: "Insert new password",
                    labelText: "New Password",
                    // Menambahkan circular border agar lebih rapi
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  // Menambahkan behavior saat data disimpan
                  onSaved: (String? value) {
                    setState(() {
                      _newPassword1 = value!;
                    });
                  },
                  // Validator sebagai validasi form
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password!';
                    }
                    return null;
                  },
                ),
              ),

              // Text input verify password
              Padding(
                // Menggunakan padding sebesar 8 pixels
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: "Insert new password again",
                    labelText: "Verify Password",
                    // Menambahkan circular border agar lebih rapi
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  // Menambahkan behavior saat data disimpan
                  onSaved: (String? value) {
                    setState(() {
                      _newPassword2 = value!;
                    });
                  },
                  // Validator sebagai validasi form
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password!';
                    }
                    return null;
                  },
                ),
              ),
              // Button
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorPalette.secondaryColor,
                  minimumSize: const Size(100, 40),
                  textStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () async {
                  if (_passwordFormKey.currentState!.validate()) {
                    _passwordFormKey.currentState!.save();
                    final response = await request.post("https://restore-the-shore.up.railway.app/myaccount/password_change",
                        {
                          "old_password" : _oldPassword,
                          "new_password1" : _newPassword1,
                          "new_password2" : _newPassword2,
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
                                const Center(child: Text('Change password success!')),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
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
                },
                child: const Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}