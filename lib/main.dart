import 'dart:async';

import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:snake_flame_flutter_medium/components/board.dart';

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
    super.onLoad();

    add(Board(this, boardSize: Vector2(200, 200))); // <- adds the board to the game
  }
}
