import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pics_quotes/widgets/pic_list.dart';

import 'package:http/http.dart' show get;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Future<Map<String, String>> getPhoto() async {
    var res = await get(Uri.parse('https://zenquotes.io/api/random'));
    var data = jsonDecode(res.body);
    var rnd = Random();
    var i = rnd.nextInt(50);
    return {
      'imgUrl': 'https://picsum.photos/${400+i}/${300+i}',
      'captionText': data[0]['q']
    };
  }

  final List<Map<String, String>> _list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pics and quotes'),
          centerTitle: true,
        ),
        floatingActionButton: SizedBox(
          child: FittedBox(
            child: FloatingActionButton(
                onPressed: () async {
                  var res = await getPhoto();
                  setState(() {
                    _list.add(res);
                  });
                },
                child: Icon(
                  Icons.add,
                )),
          ),
          height: 80,
          width: 80,
        ),
        body: PicList(
          elements: _list,
        ));
  }
}
