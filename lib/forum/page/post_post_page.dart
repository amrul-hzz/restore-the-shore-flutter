import 'package:flutter/material.dart';
import 'package:restore_the_shore_flutter/colorpalette.dart';
import 'package:restore_the_shore_flutter/nav_bar.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
//
import 'package:restore_the_shore_flutter/forum/model/post_model.dart';
import 'package:restore_the_shore_flutter/forum/page/forum_page.dart';

class PostPostPage extends StatefulWidget {
  const PostPostPage({super.key});

  @override
  State<PostPostPage> createState() => _PostPostPageState();
}

class _PostPostPageState extends State<PostPostPage> {
  final _formKey = GlobalKey<FormState>();

  String _image = '';
  String _content = '';

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      bottomNavigationBar: const NavBar(),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Create A New Post",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  )
                )
              ),

              // add image
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Image URL',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (String? value) {
                    _image = value!;
                  },
                  onSaved: (String? value) {
                    _image = value!;
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                        return 'Image URL cannot be empty';
                      }
                      Uri uri;
                      try {
                        uri = Uri.parse(value);
                      } catch (error) {
                        return 'Image URL is not valid';
                      }
                      if (!(uri.isAbsolute)) return 'Image URL is not valid';
                      return null;
                  },
                )
              ),

               // add content
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Content',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (String? value) {
                    _content = value!;
                  },
                  onSaved: (String? value) {
                    _content = value!;
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Content cannot be empty';
                    }
                    return null;
                  },
                )
              ),

              // add post button
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  child: Text("Post"),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(40),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      postPost(request, _content, _image).then(
                        (value) {
                          if (!mounted) return;
                          if (value == null) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Couldn\'t post to server'),
                            ));
                          } 
                          else {
                            // Navigator.pop(context);
                            // Navigator.pushReplacementNamed(context, '/forum');
                            Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ForumPage()                                                                   
                                    ),
                                  );
                          }
                        },
                      );
                    }
                  },
                )
              )
            ]
          )
        )
      )
    );
  }
}