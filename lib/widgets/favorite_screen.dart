import 'package:flutter/material.dart';
import 'package:pics_quotes/models/pic_quote_model.dart';
import 'package:pics_quotes/widgets/pic_list.dart';

class FavoriteScreen extends StatefulWidget {
  final List<PicQuote> elements;
  const FavoriteScreen({Key? key, required this.elements}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: PicList(elements: this.widget.elements, clickFavorite: (_) {}));
  }
}
