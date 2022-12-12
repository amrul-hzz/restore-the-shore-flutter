import 'package:flutter/material.dart';
import 'package:restore_the_shore_flutter/colorpalette.dart';
import 'package:restore_the_shore_flutter/nav_bar.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
//
import 'package:restore_the_shore_flutter/forum/model/post_model.dart';
import 'package:restore_the_shore_flutter/forum/model/comment_model.dart';
import 'package:restore_the_shore_flutter/forum/page/forum_page.dart';
import 'package:restore_the_shore_flutter/forum/page/show_comments_page.dart';


class PostCommentPage extends StatefulWidget {
  PostCommentPage({super.key, this.original_post_id});
  var original_post_id;

  @override
  State<PostCommentPage> createState() => _PostCommentPageState();
}

class _PostCommentPageState extends State<PostCommentPage> {
  final _formKey = GlobalKey<FormState>();
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
                  "Create A New Comment",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  )
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
                      postComment(request, _content, widget.original_post_id).then(
                        (value) {
                          if (!mounted) return;
                          if (value == null) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Couldn\'t post to server'),
                            ));
                          } 
                          else {
                            Navigator.pop(context);
                            Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ShowCommentsPage(
                                                            original_post_id:widget.original_post_id
                                                            )               
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