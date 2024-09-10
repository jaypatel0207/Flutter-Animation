import 'package:flutter/material.dart';

class TweenAnimation extends StatefulWidget {
  @override
  _TweenAnimationState createState() => _TweenAnimationState();
}

class _TweenAnimationState extends State<TweenAnimation> {
  Color c1 = Colors.white;
  Color c2 = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tween Animation',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                TweenAnimationBuilder<Color?>(
                  tween: ColorTween(begin: c1, end: c2),
                  duration: const Duration(seconds: 1),
                  builder: (BuildContext context, Color? color, Widget? child) {
                    return ColorFiltered(
                      colorFilter: ColorFilter.mode(
                          color ?? Colors.transparent, BlendMode.modulate),
                      child: Image.asset(
                        'images/gymna.png',
                        height: 180,
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      c1 = c1 == Colors.white ? Colors.blue : Colors.white;
                      c2 = c2 == Colors.blue ? Colors.white : Colors.blue;
                    });
                  },
                  child: const Text('Change Color'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
