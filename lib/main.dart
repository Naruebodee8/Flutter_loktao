import 'package:flutter/material.dart';
import 'dart:math'; // 1. ต้อง import เพื่อใช้ Random()

void main() {
  runApp(const MaterialApp(
    home: MainApp(),
  ));
}

// 2. เปลี่ยนเป็น StatefulWidget
class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  // 3. สร้างตัวแปรเก็บชื่อรูปภาพ (ตั้งค่าเริ่มต้นไว้)
  var activeDice = 'assets/images/dice-1.png';

  // 4. ฟังก์ชัน rollDice ต้องอยู่ในนี้
  void rollDice() {
    setState(() {
      // สุ่มเลข 1-6
      var diceNumber = Random().nextInt(6) + 1;
      // อัปเดตชื่อรูปภาพ
      activeDice = 'assets/dice-$diceNumber.png';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.white, Colors.blue, Colors.green],
          ),
        ),
        child: Center(
          child: Column( // ใช้ Column เพื่อวางรูปและปุ่มต่อกัน
            mainAxisSize: MainAxisSize.min,
            children: [
              // 5. แสดงรูปภาพจากตัวแปร activeDice
              Image.asset(
                activeDice,
                width: 200,
              ),
              const SizedBox(height: 20), // เพิ่มระยะห่าง
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.all(16.0),
                ),
                onPressed: rollDice,
                child: const Text('Roll The Dice'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}