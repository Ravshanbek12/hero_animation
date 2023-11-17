import 'package:flutter/material.dart';
import 'package:hero_animation/photo_hero_radial.dart';
import 'package:hero_animation/radial_exprasion.dart';

class RadialExpansionDemo extends StatelessWidget {
  static const double kMinRadius = 32.0;
  static const double kMaxRadius = 128.0;
  static const opacityCurve =
  Interval(0.0, 0.75, curve: Curves.fastLinearToSlowEaseIn);

  const RadialExpansionDemo({Key? key}) : super(key: key);

  static Widget _buildPage(
      BuildContext context, String imageName, String description) {
    return Container(
      color: Theme.of(context).canvasColor,
      child: Center(
        child: Card(
          elevation: 8.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: kMaxRadius * 2.0,
                height: kMaxRadius * 2.0,
                child: Hero(
                  createRectTween: (begin, end) =>
                      MaterialRectCenterArcTween(begin: begin, end: end),
                  tag: imageName,
                  child: RadialExpansion(
                    maxRadius: kMaxRadius,
                    child: Photo(
                      photo: imageName,
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              Text(
                description,
                style: const TextStyle(fontWeight: FontWeight.bold),
                textScaleFactor: 3.0,
              ),
              const SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHero(
      BuildContext context, String imageName, String description) {
    return Container(
      width: kMinRadius * 3,
      height: kMinRadius * 3,
      child: Hero(
        createRectTween: (begin, end) =>
            MaterialRectCenterArcTween(begin: begin, end: end),
        tag: imageName,
        child: RadialExpansion(
          maxRadius: kMaxRadius,
          child: Photo(
            photo: imageName,
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (_, animation, secondaryAnimation) {
                    return AnimatedBuilder(
                      animation: animation,
                      builder: (_, child) {
                        return Opacity(
                          opacity: opacityCurve.transform(animation.value),
                          child: _buildPage(context, imageName, description),
                        );
                      },
                    );
                  },
                ),
              );
            },
            color: Colors.blue,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Radial Hero Animation'),
      ),
      body: Container(
        padding: const EdgeInsets.all(32),
        alignment: Alignment.bottomCenter,
        color: Colors.transparent,
        child: Row(
          children: [
            _buildHero(
              context,
              'assets/images/marsades1.png',
              "Mercedes Benz",
            ),
            SizedBox(width: 10,),
            _buildHero(
              context,
              'assets/images/marsades2.png',
              "Mercedes Benz",
            ),
            SizedBox(width: 10,),
            _buildHero(
              context,
              'assets/images/marsades3.png',
              "Mercedes Benz",
            ),
          ],
        ),
      ),
    );
  }
}