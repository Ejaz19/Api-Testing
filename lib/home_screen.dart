import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models/posts_model.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

   List<PostsModel> postList = [];

  Future<List<PostsModel>> getPostApi () async{
    
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
    for(Map<String,dynamic> i in data){
     postList.add(PostsModel.fromJson(i));
    }
    return postList;
    }else{
      return postList;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api Course'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPostApi(),
              builder: (context, snapshot) {
                if(!snapshot.hasData){
                  return Center(child: Text('Loading'));
                } else{
                  return ListView.builder(
                    itemCount: postList.length,
                    itemBuilder: (context,index){
                      return Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(postList[index].title.toString()),
                          ],
                        ),
                      );
                  });
                }
              }
            ),
          )
        ],
      ),
    );
  }
}