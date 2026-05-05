import 'dart:math';
import 'package:flutter/material.dart';

class SlotMachine extends StatefulWidget {
  const SlotMachine({super.key});

  @override
  State<SlotMachine> createState() => _SlotMachineState();
}

class _SlotMachineState extends State<SlotMachine> {
  final _random = Random();
  final _symbols = [
    'assets/images/cherry.png',
    'assets/images/lemon.png',
    'assets/images/seven.png',
  ];

  int _coins = 10;
  String _slot1 = 'assets/images/cherry.png';
  String _slot2 = 'assets/images/lemon.png';
  String _slot3 = 'assets/images/seven.png';
  String _message = 'Крутите барабаны!';

  void _spin() {
    _slot1 = _symbols[_random.nextInt(_symbols.length)];
    _slot2 = _symbols[_random.nextInt(_symbols.length)];
    _slot3 = _symbols[_random.nextInt(_symbols.length)];

    if (_slot1 == _slot2 && _slot2 == _slot3) {
      _coins += 3;
      _message = 'Победа! 🎉';
    } else {
      _coins -= 1;
      _message = 'Попробуй ещё раз 😔';
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '💰 Монеты: $_coins',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(_slot1, width: 100, height: 100),
              Image.asset(_slot2, width: 100, height: 100),
              Image.asset(_slot3, width: 100, height: 100),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            _message,
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _spin,
            child: const Text('🎰 КРУТИТЬ'),
          ),
        ],
      ),
    );
  }
}