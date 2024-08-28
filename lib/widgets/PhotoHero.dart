import 'package:animation_flutt/widgets/MainSlideTile.dart';
import 'package:flutter/material.dart';

class PhotoHero extends StatelessWidget {
  const PhotoHero({Key? key, required this.photo, this.onTap, this.width = 20})
   : super(key: key);


  final String photo;
  final VoidCallback ? onTap;
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: MainSlideTile(imagePath: photo)
          ),
        ),
      ),
    );
  }
}
