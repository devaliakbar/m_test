import 'dart:async';

import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  int _number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page1"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _number++;
                  });
                },
                child: const Text("Increment"),
              ),
              const SizedBox(height: 25),
              SubWidget(number: _number),
            ],
          ),
        ),
      ),
    );
  }
}

class SubWidget extends StatefulWidget {
  const SubWidget({required this.number, super.key});

  final int number;

  @override
  State<SubWidget> createState() => _SubWidgetState();
}

class _SubWidgetState extends State<SubWidget> {
  String _renderValue = "";
  Timer? _timer;

  @override
  void initState() {
    _initialize();

    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();

    super.dispose();
  }

  void _initialize() {
    _timer?.cancel();

    setState(() {
      _renderValue = "Loading...";
    });

    _timer = Timer(const Duration(seconds: 2), () {
      _timer?.cancel();

      setState(() {
        _renderValue = "Number : ${widget.number}";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _renderValue,
      textAlign: TextAlign.center,
    );
  }
}
