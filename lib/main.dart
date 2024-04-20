import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyGame());
}

class MyGame extends StatelessWidget {
  const MyGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GameWidget(
        game: SnakeGame(),
      ),
    );
  }
}

class SnakeGame extends FlameGame {
  @override
  Color backgroundColor() => Colors.white;

  @override
  Future<void> onLoad() async {
    return super.onLoad();
  }
}
