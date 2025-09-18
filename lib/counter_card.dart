import 'package:flutter/material.dart';

class CounterCard extends StatefulWidget {
  const CounterCard(
      {super.key,
      required this.getCounter,
      required this.index,
      required this.value});

  final void Function(int index) getCounter;
  final int index;
  final int value;

  @override
  State<CounterCard> createState() => _CounterCardState();
}

class _CounterCardState extends State<CounterCard> {
  void _incrementCounter() {
    widget.getCounter(widget.index);
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
