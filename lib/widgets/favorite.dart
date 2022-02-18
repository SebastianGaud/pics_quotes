import 'package:flutter/material.dart';

class Favorite extends StatefulWidget {
  final Function click;
  const Favorite({Key? key, required this.click}) : super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isFavorite = !_isFavorite;
        });
        
        this.widget.click;
      },
      child: Icon(
        Icons.favorite,
        color: _isFavorite ? Colors.red : Colors.white,
      ),
    );
  }
}
