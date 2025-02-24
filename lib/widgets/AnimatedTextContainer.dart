import 'package:flutter/material.dart';
import 'dart:async';

class AnimatedTextContainer extends StatefulWidget {
  const AnimatedTextContainer({super.key});

  @override
  State<AnimatedTextContainer> createState() => _AnimatedTextContainerState();
}

class _AnimatedTextContainerState extends State<AnimatedTextContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
  String _displayedText = "";
  int _currentIndex = 0;

  final String _fullText =
      "Meron lng ako APAT na katanungan bago ka mag simula";
  final List<String> _words = [
    "Meron",
    "lng",
    "ako",
    "APAT",
    "na",
    "katanungan",
    "bago",
    "ka",
    "mag",
    "simula"
  ];
  final Duration _typingSpeed = const Duration(milliseconds: 50);

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);

    _controller.forward().then((_) => _startTypingEffect());
  }

  void _startTypingEffect() {
    Timer.periodic(_typingSpeed, (timer) {
      if (_currentIndex < _fullText.length) {
        setState(() {
          _displayedText = _fullText.substring(0, _currentIndex + 1);
          _currentIndex++;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: CustomPaint(
          painter: SpeechBubblePainter(),
          child: Container(
            padding: const EdgeInsets.all(35),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: RichText(
              text: TextSpan(
                children: _buildTextSpans(),
                style: const TextStyle(
                  fontSize: 13,
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w800,
                  height: 1.22,
                  letterSpacing: 1.95,
                ),
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
      ),
    );
  }

  List<TextSpan> _buildTextSpans() {
    List<TextSpan> spans = [];
    String currentText = _displayedText;

    for (var word in _words) {
      if (currentText.contains(word)) {
        spans.add(
          TextSpan(
            text: "$word ",
            style: TextStyle(
              color: (word == "APAT" || word == "katanungan")
                  ? const Color(0xFFFEECA4)
                  : Colors.white,
            ),
          ),
        );
        currentText = currentText.replaceFirst(word, "");
      }
    }

    return spans;
  }
}

class SpeechBubblePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.fill;

    final Paint borderPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final Path path = Path()
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height - 10),
        const Radius.circular(10),
      ))
      ..moveTo(size.width / 2 - 12, size.height - 10) // Start notch left side
      ..lineTo(size.width / 2, size.height) // Tip of the notch
      ..lineTo(size.width / 2 + 12, size.height - 10) // End notch right side
      ..close();

    canvas.drawPath(path, paint);
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
