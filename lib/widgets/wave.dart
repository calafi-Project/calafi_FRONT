import 'dart:math';
import 'package:flutter/material.dart';

enum WaveStyle { sin, cos }

class WaveWidget extends StatelessWidget {
  final Animation<double> animation;
  final double size;
  final double amplitude;
  final double position;
  final Color color;
  final WaveStyle style;

  const WaveWidget({
    required this.animation,
    required this.size,
    required this.amplitude,
    required this.position,
    required this.color,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return ClipPath(
          clipper: WaveClipper(
            value: animation.value * (size * 2),
            amplitude: amplitude,
            position: position,
            style: style,
          ),
          child: child,
        );
      },
      child: CircleAvatar(
        radius: size / 2,
        backgroundColor: color,
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  final double value;
  final double amplitude;
  final double position;
  final WaveStyle style;

  WaveClipper({
    required this.value,
    required this.amplitude,
    required this.position,
    required this.style,
  });

  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height);

    for (int i = 0; i <= size.width; i++) {
      final waveValue = style == WaveStyle.sin
          ? sin((value - i) / size.width * pi)
          : cos((value - i) / size.width * pi);

      final wave = Offset(
        i.toDouble(),
        waveValue * amplitude + position,
      );

      path.lineTo(wave.dx, wave.dy);
    }

    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
