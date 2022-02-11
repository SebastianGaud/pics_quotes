import 'package:flutter/material.dart';
import 'package:pics_quotes/widgets/pic_list_element.dart';

class PicList extends StatelessWidget {
  final List<Map<String, String>> elements;

  const PicList({Key? key, required this.elements}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];

    for (var i = 0; i < elements.length; i++) {
      var e = elements[i];
      widgets.add(
          PicListElement(imgUrl: e['imgUrl']!, captionText: e['captionText']!));
    }

    return SingleChildScrollView(
      child: Column(
        children: widgets,
      ),
    );
  }
}


/*

 PicListElement(
            imgUrl:
                'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/1200px-Image_created_with_a_mobile_phone.png',
            captionText: 'Sono  una bellissima scritta'),
*/