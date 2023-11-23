import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  int number = 0;

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
                    number++;
                  });
                },
                child: const Text("Increment"),
              ),
              const SizedBox(height: 25),
              _SubWidget(number: number),
            ],
          ),
        ),
      ),
    );
  }
}

class _SubWidget extends StatefulWidget {
  const _SubWidget({required this.number});

  final int number;

  @override
  State<_SubWidget> createState() => _SubWidgetState();
}

class _SubWidgetState extends State<_SubWidget> {
  String number = "";

  @override
  void initState() {
    number = "Number : ${widget.number}";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      number,
      textAlign: TextAlign.center,
    );
  }
}
