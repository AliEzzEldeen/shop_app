import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Core/Server/server_locator.dart';
import 'package:shop_app/Features/Login&Register/Presentation/RegisterBloc/register_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final bloc = RegisterBloc(sl());


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => bloc,
      child: BlocListener<RegisterBloc, RegisterState>(
  listener: (context, state) {
    if(state.register!.status == true){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.register!.message.toString()),
        ),
      );
    }
    if(state.register!.status == false){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.register!.message.toString()),
        ),
      );
    }
  },
  child: BlocBuilder<RegisterBloc, RegisterState>(

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
                    'Create an new account',
                    style: TextStyle(fontSize: 18, color: Colors.grey.shade500),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: userNameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'User Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),

                    ),
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.text,
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
                    controller: phoneController,
                    decoration: InputDecoration(
                      labelText: 'phone',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),
                      suffixIcon: const Icon(
                        Icons.phone,
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
                        bloc.add(SendRegisterEvent(userNameController.text, emailController.text, passwordController.text,phoneController.text));
                      },
                      child: const Text("Sign Up", style: TextStyle(fontSize: 20),),
                    ),
                  ),

                ],
              ),
            ),
          );
        },
      ),
),
    );
  }
}
