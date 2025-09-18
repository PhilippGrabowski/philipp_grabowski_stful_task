import 'package:flutter/material.dart';

class CounterCard extends StatefulWidget {
  CounterCard(
      {super.key,
      required this.getCounter,
      required this.index,
      required this.value});

  final void Function(int index, int value) getCounter;
  final int index;
  int value;

  @override
  State<CounterCard> createState() => _CounterCardState();
}

class _CounterCardState extends State<CounterCard> {
  void _incrementCounter() {
    setState(() {
      widget.value++;
    });
    widget.getCounter(widget.index, widget.value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('Zähler: ${widget.value}'),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: const Text('Click Me'),
            ),
          ],
        ),
      ),
    );
  }
}
