import 'package:flutter/material.dart';
import 'package:http_sample/screens/verify_page/verify_bloc.dart';
import 'package:lottie/lottie.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final bloc = VerifyBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Lottie.asset('assets/102231-enter-otp.json', width: 200),
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
                } else if (bloc.controller.text.length < 6) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Code wrong format"),
                  ));
                } else {
                  bloc.callRequest();
                }
              },
              child: const Text("Verify"))
        ],
      ),
    );
  }
}
