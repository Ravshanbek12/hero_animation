import 'package:flutter/material.dart';
import 'package:hero_animation/eart_screen.dart';
import 'package:hero_animation/photo_hero.dart';
import 'package:hero_animation/radial_expansion_demo.dart';

void main() {
  runApp(HeroAnimations());
}

class HeroAnimations extends StatelessWidget {
  const HeroAnimations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
        return RadialExpansionDemo();
        //   Scaffold(
        //   body: Center(
        //     child: PhotoHero(
        //       photo: 'assets/images/img.png',
        //       width: 100,
        //       onTab: () {
        //         Navigator.of(context)
        //             .push(MaterialPageRoute(builder: (_) => const EarthScreen()));
        //       },
        //     ),
        //   ),
        // );
      }),
    );
  }
}
