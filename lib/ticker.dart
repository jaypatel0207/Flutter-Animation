import "package:flutter/material.dart";



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this, // Use the SingleTickerProviderStateMixin
      duration: const Duration(seconds: 1),
    );
    _animation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(1, 0),
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller when done
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Example'),
      ),
      body: Center(
        child: SlideTransition(
          position: _animation,
          child: Container(
            width: 100,
            height: 100,
            color: Colors.blue,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.forward(); // Start the animation
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
