import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_particle_bg/particle_model.dart';
import 'package:flutter_particle_bg/particle_painter.dart';
import 'package:simple_animations/simple_animations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page',numberOfParticles: 30,),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title,this.numberOfParticles}) : super(key: key);

  final int numberOfParticles;


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final Random random = Random();

  final List<ParticleModel> particles = [];

  @override
  void initState() {

    List.generate(widget.numberOfParticles, (index){
      particles.add(ParticleModel(random));
    });
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    //该控件会为我们提供的 Painter 和生命周期需要的时间片段。
    return Rendering(
      startTime: Duration(seconds: 30),
      onTick: _simulateParticles,
      builder: (ctx,time){

        return CustomPaint(
          painter: ParticlePainter(particles,time),
        );
      },
    );
  }

  _simulateParticles(Duration time){
    particles.forEach((particle) => particle.maintainRestart(time));
  }
}
























