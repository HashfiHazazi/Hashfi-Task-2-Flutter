import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: double.infinity,
                child: LottieBuilder.asset('assets/lottie/welcome_lottie.json'),
              ),
              const Text(
                'Welcome to Hashfi Task 2 Fetch Api Learn, This app contain the data from API json with NVVM architecture',
                style: TextStyle(fontWeight: FontWeight.w500, color: Colors.grey, fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/bottomNav');
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text('CONTINUE'),
                  ),
                  
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
