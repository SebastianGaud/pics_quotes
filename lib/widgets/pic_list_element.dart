import 'package:flutter/material.dart';
import 'package:pics_quotes/widgets/favorite.dart';

class PicListElement extends StatelessWidget {
  final String imgUrl;
  final String captionText;
  final Function clickFavorite;

  const PicListElement(
      {Key? key,
      required this.imgUrl,
      required this.captionText,
      required this.clickFavorite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        elevation: 40,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Image.network(imgUrl, fit: BoxFit.cover),
            Positioned(
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 50,
                child: Text(
                  captionText,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              bottom: 10,
              left: 10,
            ),
            Positioned(
              child: Favorite(click: this.clickFavorite),
              top: 10,
              right: 10,
            )
          ],
        ),
      ),
    );
  }
}
