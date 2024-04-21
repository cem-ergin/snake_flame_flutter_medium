import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:snake_flame_flutter_medium/constants/game_constants.dart';
import 'package:snake_flame_flutter_medium/main.dart';

class Snake extends PositionComponent {
  Snake(this.gameRef, {required this.boardSize});
  final SnakeGame gameRef;
  final Vector2 boardSize;

  late Paint headPaint;
  late Vector2 headPosition;
  double timeSinceLastUpdate = 0;

  void _handleOffDimensions(Vector2 head) {
    const snakeSize = GameConstants.snakeSize;
    final divideX = boardSize.x ~/ snakeSize.ceil();
    final divideY = boardSize.y ~/ snakeSize.ceil();
    final sizeX = divideX * snakeSize;
    final sizeY = divideY * snakeSize;

    if (head.x >= boardSize.x) {
      head.x = 0;
    }
    if (head.x <= -snakeSize) {
      head.x = sizeX - snakeSize;
    }
    if (head.y >= boardSize.y) {
      head.y = 0;
    }
    if (head.y <= -snakeSize) {
      head.y = sizeY - snakeSize;
    }
  }

  @override
  FutureOr<void> onLoad() {
    super.onLoad();

    headPaint = Paint()..color = Colors.orange;
    headPosition = Vector2(0, 0);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    canvas.drawRect(
      Rect.fromLTWH(headPosition.x, headPosition.y, GameConstants.snakeSize, GameConstants.snakeSize),
      headPaint,
    );
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (timeSinceLastUpdate < 0.3) {
      timeSinceLastUpdate += dt;
      return;
    }
    timeSinceLastUpdate = 0;

    headPosition += Vector2(GameConstants.snakeSize, 0);
    _handleOffDimensions(headPosition);
  }
}
