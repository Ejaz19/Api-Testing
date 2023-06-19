import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login(String email , String password) async {
    try{
     Response response = await post(
      Uri.parse('https://reqres.in/api/register'),
      body:{
        'email' : email,
        'password' : password,
      }

     );
     if(response.statusCode == 200){
      var data = jsonDecode(response.body.toString());
      print(data['token']);
      print('account created successfully');
     }
     else{
      print('failed');
     }
    }
    catch(e){
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up Api'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Email'
              ),
            ),
            SizedBox(height: 20,),
             TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'Password'
              ),
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: () {
                login(emailController.text.toString(),passwordController.text.toString());
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text('Sign Up'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}