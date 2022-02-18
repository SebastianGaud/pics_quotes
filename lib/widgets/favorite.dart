import 'package:flutter/material.dart';

class Favorite extends StatefulWidget {
  final Function click;
  final bool isFavorite;
  const Favorite({Key? key,required this.click, this.isFavorite = false}) : super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = this.widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isFavorite = !_isFavorite;
        });
        
        this.widget.click();
      },
      child: Icon(
        Icons.favorite,
        color: _isFavorite ? Colors.red : Colors.white,
      ),
    );
  }
}
