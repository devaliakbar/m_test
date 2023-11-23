import 'package:flutter/material.dart';

class SubWidget extends StatefulWidget {
  const SubWidget({super.key, required this.index});

  final int index;

  @override
  State<SubWidget> createState() => _SubWidgetState();
}

class _SubWidgetState extends State<SubWidget> {
  int index = 0;

  @override
  void initState() {
    index = widget.index;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '$index',
      textAlign: TextAlign.center,
    );
  }
}
