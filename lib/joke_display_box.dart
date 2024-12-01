import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class JokeDisplayBox extends StatelessWidget {
  String joke;

  JokeDisplayBox({super.key, required this.joke});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 350,
      decoration: BoxDecoration(
        color: const Color.fromARGB(239, 241, 212, 156),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.white30, width: 2.5),
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(153, 231, 112, 8),
            Color.fromARGB(255, 182, 108, 48)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 12,
            spreadRadius: 8,
          ),
        ],
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 50),
            child: Center(
              child: SingleChildScrollView(
                child: Text(
                  joke,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 5,
            left: 5,
            child: IconButton(
              onPressed: () {
                Clipboard.setData(
                  ClipboardData(text: joke),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    duration: Duration(milliseconds: 500),
                    content: Text(
                      'تم نسخ ',
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.copy,
                size: 35,
                color: Colors.white60,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
