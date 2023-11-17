import 'package:flutter/material.dart';
import 'package:hero_animation/photo_hero.dart';

class EarthScreen extends StatelessWidget {
  const EarthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PhotoHero(photo: 'assets/images/img.png', width: 400, onTab: () {
        Navigator.of(context).pop();
      },),
    );
  }
}
