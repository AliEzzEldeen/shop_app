import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Core/Server/server_locator.dart';
import 'package:shop_app/Features/Login&Register/Presentation/LoginBloc/login_bloc.dart';

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
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 250,
                  ),
                  const Text(
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
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),
                      suffixIcon: const Icon(
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
                      suffixIcon: const Icon(
                        Icons.visibility,
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Center(

                    child: ElevatedButton(
                      style: const ButtonStyle(),
                      onPressed: () {
                        bloc.add(SendLoginEvent(email: emailController.text,
                            password: passwordController.text));
                      },
                      child: const Text("Login", style: TextStyle(fontSize: 20),),
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
