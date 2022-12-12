import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:restore_the_shore_flutter/colorpalette.dart';
import 'package:restore_the_shore_flutter/nav_bar.dart';
import 'package:restore_the_shore_flutter/forum/model/post_model.dart';

class MyPostPage extends StatefulWidget {
  const MyPostPage({super.key});

  @override
  State<MyPostPage> createState() => _MyPostPageState();
}

class _MyPostPageState extends State<MyPostPage> {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text('My Posts'),
      ),
      body: FutureBuilder(
          future: fetchMyPosts(request),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.data.length == 0) {
                return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Text(
                          "You haven't post anything :(",
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                );
              } else {
                return ListView.builder(
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
                              "${snapshot.data![index].fields.creator_name}",
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Divider(),

                            const SizedBox(height: 10),
                            
                            Image(image: NetworkImage("${snapshot.data![index].fields.image}")),

                            const Divider(),

                            const SizedBox(height: 10),

                            Text(
                              "${snapshot.data![index].fields.content}",
                              style: const TextStyle(
                                fontSize: 18.0,
                              ),
                            ),

                            const SizedBox(height: 12),

                            Text(
                              snapshot.data![index].fields.date.toString().substring(0, 10),
                              style: const TextStyle(
                                fontSize: 12.0,
                              ),
                            ),

                          ],
                        )
                    )
                );
              }
            }
          })
    );
  }
}

Future<List<Post>> fetchMyPosts(request) async{
  var url = "https://restore-the-shore.up.railway.app/forum/json-by-user";
  var response = await request.get(url);

  var data = response;

  List<Post> listPosts = [];
  for (var d in data){
    if (d != null){
      listPosts.add(Post.fromJson(d));
    }
  }

  return listPosts;
}
