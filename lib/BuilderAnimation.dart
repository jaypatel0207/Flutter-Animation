import 'package:flutter/material.dart';

class BuilderAnimation extends StatefulWidget {
  @override
  _BuilderAnimationState createState() => _BuilderAnimationState();
}

class _BuilderAnimationState extends State<BuilderAnimation>
    with TickerProviderStateMixin {
  late Animation _starAnimation;
  late AnimationController _starAnimationController;

  bool toggle = false;

// animation controller
  @override
  void initState() {
    super.initState();
    _starAnimationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    _starAnimation = Tween(begin: 140.0, end: 160.0).animate(CurvedAnimation(
        curve: Curves.elasticInOut, parent: _starAnimationController));

    _starAnimationController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _starAnimationController.repeat();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _starAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "AnimatedBuilder",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
         const    Text(
              'AnimatedBuilder',
              style: TextStyle(fontSize: 20),
            ),
      const       SizedBox(
              height: 10,
            ),

            // animated container
            // goes as a child
            SizedBox(
              height: 200,
              width: 200,
              child: AnimatedBuilder(
                animation: _starAnimationController,
                builder: (context, child) {
                  return Center(
                    child: Center(
                      child: Icon(
                        Icons.audiotrack,
                        color: Colors.orangeAccent,
                        size: _starAnimation.value,
                      ),
                    ),
                  );
                },
              ),
            ),
        const     SizedBox(
              height: 10,
            ),

            // button
            ElevatedButton(
              child: const Text('START/ STOP'),
              onPressed: () {
                toggle = !toggle;
                toggle == true
                    ? _starAnimationController.forward()
                    : _starAnimationController.stop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
