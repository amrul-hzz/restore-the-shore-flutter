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
import 'package:restore_the_shore_flutter/forum/page/post_comment_page.dart';



class ShowCommentsPage extends StatefulWidget {
  ShowCommentsPage({super.key, this.originalPostId});
  var originalPostId;

  @override
  State<ShowCommentsPage> createState() => _ShowCommentsPageState();
}

class _ShowCommentsPageState extends State<ShowCommentsPage> {
  final _formKey = GlobalKey<FormState>();
  String _content = '';

  @override 
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
       bottomNavigationBar: const NavBar(),
       body: FutureBuilder(
        future: request.get('https://restore-the-shore.up.railway.app/forum/json-comments/${widget.originalPostId}'),
        builder: (context, AsyncSnapshot snapshot) {
          if(snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          }
          else {
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
                              "${snapshot.data[index]["fields"]["creator_name"]}",
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
                          ],
                        )
                      )
                    ),
                  )
                ),
                
                Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget> [
                        FloatingActionButton(
                          onPressed: () {
                            Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PostCommentPage(originalPostId:widget.originalPostId)                                
                                    ),
                                  );
                          },
                          backgroundColor: Colors.blue,
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
    );
  }
}