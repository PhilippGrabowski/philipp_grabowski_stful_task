import 'package:flutter/material.dart';

class CounterCard extends StatefulWidget {
  const CounterCard({super.key, required this.getCounter, required this.index});

  final void Function(int index, int value) getCounter;
  final int index;

  @override
  State<CounterCard> createState() => _CounterCardState();
}

class _CounterCardState extends State<CounterCard> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('Zähler: $_counter'),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _counter++;
                });
                widget.getCounter(widget.index, _counter);
              },
              child: const Text('Click Me'),
            ),
          ],
        ),
      ),
    );
  }
}
