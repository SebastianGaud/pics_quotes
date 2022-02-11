import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pics_quotes/widgets/body.dart';
import 'package:pics_quotes/widgets/pic_list.dart';

import 'package:http/http.dart' show get;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Future<Map<String, String>> getPhoto() async {
    var rnd = Random();
    var photoId = rnd.nextInt(5000);
    var res = await get(Uri.parse('https://jsonplaceholder.typicode.com/photos/$photoId'));
    var data = jsonDecode(res.body);
    return {
      'imgUrl': data['url'],
      'captionText': data['title']
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
