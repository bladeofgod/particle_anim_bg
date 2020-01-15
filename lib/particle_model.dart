




import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class ParticleModel{
  Animatable tween;

  double size;

  AnimationProgress animationProgress;
  Random random;


  ParticleModel(this.random){
    restart();
  }

  restart({Duration time = Duration.zero}){
    //x 值 在-0.2 到 1.2之间

    //y 1.2 确保 从屏幕低端之外进入
    final startPosition = Offset(-0.2 + 1.4 * random.nextDouble(),1.2);
    //y 负数 确保 移出屏幕顶端
    final endPosition = Offset(-0.2 + 1.4 * random.nextDouble(),-0.2);
    final duration = Duration(milliseconds: 5000 + random.nextInt(1000));

    tween = MultiTrackTween(
      [
        Track("x").add(duration, Tween(begin: startPosition.dx,end:
        endPosition.dx),curve: Curves.easeInOutSine),
        Track("y").add(duration, Tween(begin: startPosition.dy,end: endPosition.dy)
        ,curve: Curves.easeIn)
      ]
    );

    animationProgress = AnimationProgress(duration:  duration,startTime: time);
    size = 0.2 + random.nextDouble() * 0.4;

  }

  maintainRestart(Duration time){
    if(animationProgress.progress(time) == 1.0){
      restart(time: time);
    }
  }

}





















