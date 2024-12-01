import 'dart:math';

class Logic {
  final List<String> jokes;
  Logic(this.jokes);
  Map<int, bool> usedJokes = {};

  int isUsedJoke() {
    if (usedJokes.length == jokes.length) {
      usedJokes.clear();
    }

    int selectedJokeIndex;

    do {
      selectedJokeIndex = Random().nextInt(jokes.length);
    } while (usedJokes.containsKey(selectedJokeIndex));

    usedJokes[selectedJokeIndex] = true;

    return selectedJokeIndex;
  }

  String getRandomJoke() {
    return jokes[isUsedJoke()];
  }
}
