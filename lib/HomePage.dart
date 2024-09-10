import 'package:flutter/material.dart';
import 'package:flutter_animation/AnimatedXYZ.dart';
import 'package:flutter_animation/BuilderAnimation.dart';
import 'package:flutter_animation/PageRoute.dart';
import 'package:flutter_animation/TweenAnimation.dart';
import 'package:flutter_animation/XYZTransition.dart';
import 'package:shimmer/shimmer.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
  
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Animation',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: _isLoading ? _buildShimmerEffect() : _buildContent(),
      ),
    );
  }

  Widget _buildShimmerEffect() {
    return Column(
      children: [
        Shimmer.fromColors(
        
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Column(
            children: List.generate(5, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: ElevatedButton(onPressed: (){}, child: const Text(""))
                
                
                
              
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildContent() {
    return Column(
      children: [
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return TweenAnimation();
              },
            ));
          },
          child: const Text("Tween Animation"),
        ),
        const SizedBox(height: 15),
        ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return AnimatedXYZ();
              },
            ));
          },
          child: const Text("AnimateXYZ"),
        ),
        const SizedBox(height: 15),
        ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return XYZTransition();
              },
            ));
          },
          child: const Text("XYZTransition"),
        ),
        const SizedBox(height: 15),
        ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return BuilderAnimation();
              },
            ));
          },
          child: const Text("AnimatedBuilder"),
        ),
        const SizedBox(height: 15),
        ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const Homepage1();
              },
            ));
          },
          child: const Text("PageRoute Animation"),
        ),
      ],
    );
  }
}
