import 'package:flutter/material.dart';

class AnimatedXYZ extends StatefulWidget {
  @override
  _AnimatedXYZState createState() => _AnimatedXYZState();
}

class _AnimatedXYZState extends State<AnimatedXYZ> {
  bool _toggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Text(
          'AnimateXYZ',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 80,
                ),
                AnimatedContainer(
                  // child: SingleChildScrollView(
                  //   child: Column(
                  //     children: [
                  //       Text("Jay", style: TextStyle(color: _toggle == true ? Colors.white : Colors.yellow),),
                  //       Text("Jay"),
                  //       Text("Jay"),
                  //       Text("Jay"),
                  //       Text("Jay"),
                  //       Text("Jay"),
                  //       Text("Jay"),
                  //       Text("Jay"),
                  //       Text("Jay"),
                  //     ],
                  //   ),
                  // ),
                  decoration: BoxDecoration(
                    color: _toggle == true ? Colors.blueAccent : Colors.red,
                    borderRadius:const  BorderRadius.all(Radius.circular(8)),
                  ),
                  curve: Curves.easeInOutBack,
                  duration: const Duration(seconds: 1),
                  height: _toggle == true ? 100 : 400,
                  width: _toggle == true ? 100 : 200,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _toggle = !_toggle;
                    });
                  },
                  child: const Text('Animate'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
