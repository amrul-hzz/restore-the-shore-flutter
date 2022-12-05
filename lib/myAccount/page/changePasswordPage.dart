import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restore_the_shore_flutter/colorpalette.dart';
import 'package:restore_the_shore_flutter/myAccount/page/myAccount.dart';

class MyPasswordFormPage extends StatefulWidget {
  const MyPasswordFormPage({super.key});

  @override
  State<MyPasswordFormPage> createState() => _MyPasswordFormPageState();
}

class _MyPasswordFormPageState extends State<MyPasswordFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _oldPassword = "";
  String _newPassword1 = "";
  String _newPassword2 = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),
      ),
      body: Form(
        key: _formKey,
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
                  onChanged: (String? value) {
                    setState(() {
                      _newPassword1 = value!;
                    });
                  },
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
                  onChanged: (String? value) {
                    setState(() {
                      _newPassword2 = value!;
                    });
                  },
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
                    else if (value != _newPassword1) {
                      return 'Password did not match!';
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
                onPressed: () {
                  if (_formKey.currentState!.validate()) {

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
