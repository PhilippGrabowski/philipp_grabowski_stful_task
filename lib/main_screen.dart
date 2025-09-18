import 'package:flutter/material.dart';
import 'package:stful_task/counter_card.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final Map<String, int> counterMap = {
    'counter1': 0,
    'counter2': 0,
    'counter3': 0,
    'counter4': 0,
    'counter5': 0
  };
  int get sum => counterMap.values.reduce((value, element) => value + element);

  void updateCounterMap(int index, int counter) {
    setState(() {
      counterMap['counter$index'] = counter;
    });
  }

  void _resetCounterMap() {
    setState(() {
      counterMap.forEach((key, value) => counterMap[key] = 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          spacing: 16,
          children: [
            for (int i = 1; i < counterMap.entries.length + 1; i++)
              CounterCard(
                  getCounter: updateCounterMap,
                  index: i,
                  value: counterMap.values.elementAt(i - 1)),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8,
              children: [
                Text(
                  'Die Summe aller Counter ist:',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  sum.toString(),
                  style: TextStyle(fontSize: 21, color: Colors.pink[200]),
                )
              ],
            ),
            ElevatedButton(
                onPressed: _resetCounterMap, child: Text('Reset Counter'))
          ],
        ),
      ),
    );
  }
}
