
import 'package:flutter/material.dart';
import 'package:restore_the_shore_flutter/colorpalette.dart';
import 'package:restore_the_shore_flutter/nav_bar.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
//
import 'package:restore_the_shore_flutter/login.dart';
import 'package:restore_the_shore_flutter/forum/model/post_model.dart';
import 'package:restore_the_shore_flutter/forum/model/comment_model.dart';
import 'package:restore_the_shore_flutter/forum/page/show_comments_page.dart';
import 'package:restore_the_shore_flutter/forum/page/post_post_page.dart';

class ForumPage extends StatefulWidget {
  const ForumPage({super.key});

  final String title = 'Forum';

  @override
  State<ForumPage> createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      bottomNavigationBar: const NavBar(), // ini cara buatr NavBar nya, jangan lupa import dulu
      body: request.loggedIn
      ? FutureBuilder(
        future: fetchPosts(request),
        builder: (context, AsyncSnapshot snapshot) {
          if(snapshot.data == null){
            return const Center(child: CircularProgressIndicator()); 
          }
          else{
            
              return Column(
                children: <Widget>[
                  Expanded(
                    child: SizedBox(
                      height: 200.0,
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index)=> Container(
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
                                "${snapshot.data[index].fields.creator_name}",
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 10),

                              Image.network(snapshot.data![index].fields.image),

                              Text(
                                "${snapshot.data![index].fields.content}",
                                style: const TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),

                              TextButton(
                                style: ButtonStyle(
                                  foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                                ),
                                child: Text('Go to comments'),
                                onPressed: () { 
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ShowCommentsPage(
                                                            original_post_id:snapshot.data![index].pk
                                                            )               
                                    ),
                                  );
                                },
                              )

                            ],

                          )
                        )
                      ),
                    )
                  ),

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget> [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PostPostPage()                                
                                    ),
                                  );
                          },
                          child: const Icon(Icons.add),
                        ),
                      ]
                    )
                  )
                ]
              );
            }
          }
        
    
      )

      // apabila belum login 
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
                  Navigator.push( context, MaterialPageRoute(
                                  builder: (context) => LoginPage()                                
                                  ),
                                );
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
