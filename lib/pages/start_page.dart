import 'package:flutter/material.dart';
import 'package:quis_app/pages/play_quis_page.dart';

import '../components/color.dart';

class StartQuisPage extends StatelessWidget {
  const StartQuisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.topRight,
            colors: [
              Color(0xff005AA7),
              Color.fromARGB(255, 133, 167, 223),
            ],
          ),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Quis App",
                style: TextStyle(
                  color: title,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.blue.shade400,
                      offset: const Offset(1.5, 1),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const PlayQuisPage()),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: foregroundColor,
                ),
                child: const Text(
                  "Start Quiz",
                  style: TextStyle(
                    color: title,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
