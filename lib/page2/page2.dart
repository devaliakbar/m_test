import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  int _currentPage = 0;

  final _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page2"),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                pageSnapping: false,
                onPageChanged: (int value) {
                  setState(() {
                    _currentPage = value;
                  });
                },
                children: const [
                  _MyPage1Widget(validationError: null),
                  _MyPage2Widget(validationError: null),
                  _MyPage3Widget(),
                ],
              ),
            ),
            Row(
              children: [
                if (_currentPage > 0)
                  IconButton(
                    onPressed: () {
                      _pageController.jumpToPage(_currentPage - 1);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  ),
                const Spacer(),
                if (_currentPage < 2)
                  IconButton(
                    onPressed: () {
                      _pageController.jumpToPage(_currentPage + 1);
                    },
                    icon: const Icon(Icons.arrow_forward_ios_rounded),
                  )
              ],
            )
          ],
        ),
      )),
    );
  }
}

class _MyPage1Widget extends StatelessWidget {
  const _MyPage1Widget({required this.validationError});

  final String? validationError;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.yellow[100],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Create username'),
          const SizedBox(height: 20),
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text('Username'),
            ),
          ),
          const SizedBox(height: 20),
          if (validationError != null)
            Text(
              validationError!,
              style: const TextStyle(color: Colors.red),
            ),
        ],
      ),
    );
  }
}

class _MyPage2Widget extends StatelessWidget {
  const _MyPage2Widget({required this.validationError});

  final String? validationError;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.blue[100],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Enter your email'),
          const SizedBox(height: 20),
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text('Email'),
            ),
          ),
          const SizedBox(height: 20),
          if (validationError != null)
            Text(
              validationError!,
              style: const TextStyle(color: Colors.red),
            ),
        ],
      ),
    );
  }
}

class _MyPage3Widget extends StatelessWidget {
  const _MyPage3Widget();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[100],
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () {},
        child: const Text("Finish"),
      ),
    );
  }
}
