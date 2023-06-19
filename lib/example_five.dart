import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import 'models/products_model.dart';
class ExampleFive extends StatefulWidget {
  const ExampleFive({super.key});

  @override
  State<ExampleFive> createState() => _ExampleFiveState();
}

class _ExampleFiveState extends State<ExampleFive> {


  Future<ProductsModel> getProductApi() async{
    final response = await http.get(Uri.parse('https://webhook.site/93ca0287-9553-4620-95e0-5bb6179918c2'));
     var data = jsonDecode(response.body.toString());
    if(response.statusCode ==200){
      return ProductsModel.fromJson(data);
    }
    else{
      return ProductsModel.fromJson(data);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Api Course'),

      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(child:
            FutureBuilder<ProductsModel>
            (
              future:getProductApi(),
              builder: 
            (context, snapshot) {
              if(snapshot.hasData){
                 return ListView.builder(
                itemCount: snapshot.data!.data!.length,
                itemBuilder: (context, index){
                 return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(snapshot.data!.data![index].shop!.name.toString()),
                      subtitle: Text(snapshot.data!.data![index].shop!.shopemail.toString()),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(snapshot.data!.data![index].shop!.image.toString()),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height *.3,
                      width: MediaQuery.of(context).size.width *1,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.data![index].images!.length,
                        itemBuilder: (context, position){
                          return Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                              height: MediaQuery.of(context).size.height *253,
                                              width: MediaQuery.of(context).size.width *.5,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image:
                                                NetworkImage(snapshot.data!.data![index].images![position].url.toString()) 
                                                
                                                )
                                              ),
                          
                            ),
                          );
                        }),
                    )
                  ],
                 );
      
              });
      
              }
              else{
                return Text('Loading');
              }
             
            }
            
            
            
            ))
          ],
        ),
      ),
    );
  }
}