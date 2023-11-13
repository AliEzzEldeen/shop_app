import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Core/Server/server_locator.dart';
import 'package:shop_app/Presentation/Controller/LoginBloc/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final bloc = LoginBloc(sl());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => bloc,
      child: BlocBuilder<LoginBloc, LoginState>(

        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 250,
                  ),
                  Text(
                    'Welcome!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'please login or sign u to continue our app',
                    style: TextStyle(fontSize: 18, color: Colors.grey.shade500),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),
                      suffixIcon: Icon(
                        Icons.email,
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                      controller: passwordController,
                     decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),
                      suffixIcon: Icon(
                        Icons.visibility,
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Center(

                    child: ElevatedButton(
                      style: ButtonStyle(),
                      onPressed: () {
                        bloc..add(SendLoginEvent(email: emailController.text,
                            password: passwordController.text));
                      },
                      child: Text("Login", style: TextStyle(fontSize: 20),),
                    ),
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
