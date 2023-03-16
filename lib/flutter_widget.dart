import 'dart:async';
import 'package:flutter/material.dart';

class FlutterWidget extends StatefulWidget {
  const FlutterWidget({super.key});

  @override
  State<FlutterWidget> createState() => _FlutterWidgetState();
}

class _FlutterWidgetState extends State<FlutterWidget> {
  static var countdownDuration = const Duration(hours: 23);
  Duration duration = const Duration();
  Timer? timer;
  bool countDown = true;

  @override
  void initState() {
    int hours;
    int mints;
    int secs;
    hours = int.parse("00");
    mints = int.parse("00");
    secs = int.parse("00");
    countdownDuration = Duration(hours: hours, minutes: mints, seconds: secs);
    startTimer();
    reset();
    super.initState();
  }

  void reset() {
    if (countDown) {
      setState(() => duration = countdownDuration);
    } else {
      setState(() => duration = const Duration());
    }
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
  }

  void addTime() {
    const addSeconds = 1;
    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      if (seconds < 0) {
        timer?.cancel();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Widget'),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(48.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              hoursWidget(hours),
              const SizedBox(width: 12),
              minutesWidget(minutes),
              const SizedBox(width: 12),
              secondWidget(seconds)
            ],
          ),
        ),
      ),
    );
  }
}

Widget hoursWidget(String time) {
  return Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.amber,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
      time,
      style: const TextStyle(
          fontWeight: FontWeight.bold, color: Colors.black, fontSize: 60),
    ),
  );
}

Widget minutesWidget(String time) {
  return Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.amber,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
      time,
      style: const TextStyle(
          fontWeight: FontWeight.bold, color: Colors.black, fontSize: 60),
    ),
  );
}

Widget secondWidget(String time) {
  return Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.amber,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
      time,
      style: const TextStyle(
          fontWeight: FontWeight.bold, color: Colors.black, fontSize: 60),
    ),
  );
}
