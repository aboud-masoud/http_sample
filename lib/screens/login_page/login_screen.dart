import 'package:flutter/material.dart';
import 'package:http_sample/screens/login_page/login_bloc.dart';
import 'package:http_sample/screens/verify_page/verify_screen.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final bloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Lottie.asset('assets/145840-nice-astronaut-landing-on-the-moon.json', width: 200),
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  controller: bloc.controller,
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (bloc.controller.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Please fill the field"),
                      ));
                    } else if (bloc.controller.text.length < 14) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Mobile wrong format"),
                      ));
                    } else {
                      bloc.callRequest().whenComplete(() {
                        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                          return VerifyScreen();
                        }));
                      });
                    }
                  },
                  child: const Text("Login"))
            ],
          ),
        ),
      ),
    );
  }
}
