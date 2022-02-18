import 'package:flutter/material.dart';

class PicListElement extends StatelessWidget {
  final String imgUrl;
  final String captionText;
  const PicListElement(
      {Key? key, required this.imgUrl, required this.captionText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        // child: Column(
        //   children: [
        //   ],
        // ),
        child: Stack(
          children: [
            Image.network(imgUrl, fit: BoxFit.cover),
            Positioned(child: 
            Text(captionText), bottom: 10, left: 10,)
          ],
        ),
      ),
    );
  }
}
