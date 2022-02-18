import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pics_quotes/models/pic_quote_model.dart';
import 'package:pics_quotes/widgets/pic_list.dart';

import 'package:http/http.dart' show get;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<PicQuote> getPhoto() async {
    var res = await get(Uri.parse('https://zenquotes.io/api/random'));
    var data = jsonDecode(res.body);
    var rnd = Random();
    var i = rnd.nextInt(50);
    return PicQuote.withId(
        quote: data[0]['q'],
        imageUrl: 'https://picsum.photos/${400 + i}/${300 + i}');
  }

  final List<PicQuote> _list = [];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var favList = _list.where((x) => x.isFavorite!).toList();
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Lista'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border_outlined),
                  label: 'Favorites')
            ],
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            }),
        appBar: AppBar(
          title: Text('Pics and quotes'),
          centerTitle: true,
        ),
        floatingActionButton: _currentIndex == 0
            ? SizedBox(
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
              )
            : Container(),
        body: _currentIndex == 0
            ? PicList(
                clickFavorite: ((picQuoteGuid) {
                  setState(() {
                    for (var item in _list) {
                      if (item.id == picQuoteGuid) {
                        item.isFavorite = true;
                      }
                    }
                  });
                }),
                elements: _list,
              )
            : PicList(
                elements: favList,
                clickFavorite: (_) {}));
  }
}
