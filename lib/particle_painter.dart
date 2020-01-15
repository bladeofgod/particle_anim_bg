


import 'package:flutter/material.dart';
import 'package:flutter_particle_bg/particle_model.dart';

class ParticlePainter extends CustomPainter{

  List<ParticleModel> particles;
  Duration time;

  ParticlePainter(this.particles,this.time);


  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint

    final paint = Paint()..color = Colors.white.withAlpha(60);

    particles.forEach((particle){
      //当前particle 动画执行进度
      var progress = particle.animationProgress.progress(time);
      //根据当前执行进度，返回对应的tween
      final animation = particle.tween.transform(progress);
      //根据当前tween（Track） 并生成圆的位置（使用画布大小 作为系数 获得绝对位置）
      final position = Offset(animation["x"] * size.width,animation["y"] *
          size.height);
      //根据随机等 绘制圆
      canvas.drawCircle(position, size.width* 0.2 * particle.size, paint);
    });

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}





















