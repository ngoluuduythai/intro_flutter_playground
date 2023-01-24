import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _width = 200;
  double _height = 200;
  Color _color = Colors.red;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(16);
  final _random = Random();

  void _randomize() {
    setState(() {
      _width = _random.nextInt(300).toDouble();
      _height = _random.nextInt(300).toDouble();
      _color = Color.fromRGBO(
          _random.nextInt(256), _random.nextInt(256), _random.nextInt(256), 1);
      _borderRadius = BorderRadius.circular(_random.nextInt(16).toDouble());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedContainer'),
      ),
      body: Center(
        child: AnimatedContainer(
          // Use the properties stored in the State class.
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: _borderRadius,
          ),
          duration: Duration(milliseconds: 300),
          curve: Curves.fastOutSlowIn,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _randomize,
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
