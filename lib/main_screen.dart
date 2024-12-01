import 'package:flutter/material.dart';

import 'joke_display_box.dart';
import 'logic.dart';
import 'repository.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final Repository _repository = Repository();
  late final Logic _logic;
  List<String> jokes = [];
  String joke = '';

  @override
  void initState() {
    super.initState();
    _initializeLogic();
  }

  void random() {
    joke = _logic.getRandomJoke();
  }

  Future<void> _initializeLogic() async {
    jokes = await _repository.fetchJokes("assets/Jokes.txt");
    _logic = Logic(jokes);
    setState(() {
      joke = _logic.getRandomJoke();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          colors: [
            Colors.deepOrange,
            Color.fromARGB(255, 41, 41, 40),
          ],
          radius: 1.1,
          center: Alignment.center,
        ),
      ),
      child: Stack(
        children: [
          
          Positioned(
            bottom: 30,
            child: Opacity(
              opacity: 0.3,
              child: Image.asset('assets/MainBlur.png'),
            ),
          ),
          
          Center(
            child: Column(
              children: [
                Image.asset('assets/WinkEmoji.png', width: 200, height: 160),
                JokeDisplayBox(joke: joke),
                const SizedBox(height: 50),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      random();
                    });
                  },
                  elevation: 10,
                  backgroundColor: const Color.fromARGB(255, 246, 178, 95),
                  child: Image.asset(
                    'assets/uim_process.png',
                    color: const Color.fromARGB(255, 38, 25, 2),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
