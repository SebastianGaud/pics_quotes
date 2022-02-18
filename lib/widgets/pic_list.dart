import 'package:flutter/material.dart';
import 'package:pics_quotes/models/pic_quote_model.dart';
import 'package:pics_quotes/widgets/pic_list_element.dart';

class PicList extends StatelessWidget {
  final List<PicQuote> elements;
  final void Function(String picQuoteGuid) clickFavorite;
  
  const PicList({Key? key, required this.elements, required this.clickFavorite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];

    for (var i = 0; i < elements.length; i++) {
      var e = elements[i];
      widgets.add(PicListElement(
        key: Key(e.id!),
        imgUrl: e.imageUrl,
        captionText: e.quote,
        isFavorite: e.isFavorite ?? false,
        clickFavorite: (){
          this.clickFavorite(e.id!);
        },
      ));
    }

    return ListView(
      children: widgets,
    );
  }
}


/*

 PicListElement(
            imgUrl:
                'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/1200px-Image_created_with_a_mobile_phone.png',
            captionText: 'Sono  una bellissima scritta'),
*/