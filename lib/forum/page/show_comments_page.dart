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

class ShowCommentsPage extends StatefulWidget {
  ShowCommentsPage({super.key, this.originalPostId});
  var originalPostId;

  @override
  State<ShowCommentsPage> createState() => _ShowCommentsPageState();
}

class _ShowCommentsPageState extends State<ShowCommentsPage> {
  @override 
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
       bottomNavigationBar: const NavBar(),
       body: request.loggedIn
        ? FutureBuilder(
          future: request.get('https://restore-the-shore.up.railway.app/forum/json-comments/${widget.originalPostId}'),
          builder: (context, AsyncSnapshot snapshot) {
            if(snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            }
            else {
              if(!snapshot.hasData){
                return Column(
                  children: const [
                    Text("Be the first to comment :)"),
                    SizedBox(height: 8),
                  ]
                );
              }
              else {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color:Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 2.0
                        )
                      ]
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${snapshot.data![index]["fields"]["creator_name"]}",
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text(
                          "${snapshot.data![index]["fields"]["content"]}",
                          style: const TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ]
                    )
                  )
                );
              }
            }
          }
    
      )

      : Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              const Color.fromRGBO(93, 192, 211, 1.0),
              ColorPalette.secondaryColor.shade800
            ]
          ),
        ),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You need to Login',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'login');
                },
                child: const Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}