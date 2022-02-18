import 'package:uuid/uuid.dart';

class PicQuote {
  String quote;
  String imageUrl;
  
  
  String? _id;
  bool? isFavorite;

  String? get id => _id;

  PicQuote({
    required this.quote,
    required this.imageUrl,
    this.isFavorite = false,
  });

  PicQuote.withId({required this.quote, required this.imageUrl}) {
    isFavorite = false;
    _id = Uuid().v1();
  }
}
