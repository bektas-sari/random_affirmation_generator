import 'dart:math';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() {
  runApp(const AffirmationApp());
}

class AffirmationApp extends StatelessWidget {
  const AffirmationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Affirmation Generator',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.teal),
      home: const AffirmationHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AffirmationHomePage extends StatefulWidget {
  const AffirmationHomePage({super.key});

  @override
  State<AffirmationHomePage> createState() => _AffirmationHomePageState();
}

class _AffirmationHomePageState extends State<AffirmationHomePage> {
  final List<String> affirmations = [
    "You are capable of amazing things.",
    "Believe in yourself.",
    "You are strong and resilient.",
    "Every day is a new beginning.",
    "You attract positive energy.",
    "Your potential is limitless.",
    "You are enough just as you are.",
    "Today will be a good day.",
    "You are becoming your best self.",
  ];

  String currentAffirmation = "";

  void _showRandomAffirmation() {
    final random = Random();
    final newAffirmation = affirmations[random.nextInt(affirmations.length)];
    setState(() {
      currentAffirmation = newAffirmation;
    });
  }

  @override
  void initState() {
    super.initState();
    _showRandomAffirmation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Affirmations'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(24),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  currentAffirmation,
                  textStyle: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                  speed: const Duration(milliseconds: 60),
                ),
              ],
              totalRepeatCount: 1,
              key: ValueKey(currentAffirmation),
              isRepeatingAnimation: false,
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: _showRandomAffirmation,
              icon: const Icon(Icons.refresh),
              label: const Text('New Affirmation'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
