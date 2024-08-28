import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MainSlideTile extends StatelessWidget {
  MainSlideTile({

  required this.imagePath,
    this.height = 177,
    this.radius =24,
   this.fit = BoxFit.fill,

});

  final String imagePath;
  final double height;
  final double radius;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: imagePath == null || imagePath.isEmpty
       ? placeHolder
          : CachedNetworkImage(
        imageUrl: imagePath,
        imageBuilder: (context,  imageProvider ) => Container(
          height: height,
          width: height,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius:  BorderRadius.all(Radius.circular(radius)),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        placeholder: (context, url) => placeHolder,
        errorWidget: (context, url, error) => Icon(
          Icons.error,
          color: Colors.grey[300],
        ),
      )
    );

  }
  
  final Widget placeHolder = Center(
    child: Container(
      child: Center(
        child: SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(strokeWidth: 1,),
        ),
      ),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24.0)),
    ),
  );
}
