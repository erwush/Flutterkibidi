import 'package:flutter/material.dart';
import 'calc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final TextEditingController aController = TextEditingController();
  final TextEditingController bController = TextEditingController();

  final Calculator calc = Calculator();

  String result = '';

  void calculate(String op) {
    final int a = int.tryParse(aController.text) ?? 0;
    final int b = int.tryParse(bController.text) ?? 0;

    try {
      String res;

      switch (op) {
        case '+':
          res = calc.add(a, b);
          break;
        case '-':
          res = calc.subtract(a, b);
          break;
        case '×':
          res = calc.multiply(a, b);
          break;
        case '÷':
          res = calc.divide(a, b);
          break;
        default:
          res = '';
      }

      setState(() {
        result = res;
      });
    } catch (e) {
      setState(() {
        result = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: aController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Angka 1'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: bController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Angka 2'),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () => calculate('+'), child: const Text('+')),
                ElevatedButton(onPressed: () => calculate('-'), child: const Text('-')),
                ElevatedButton(onPressed: () => calculate('×'), child: const Text('×')),
                ElevatedButton(onPressed: () => calculate('÷'), child: const Text('÷')),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Hasil: $result',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
    );
  }
}
