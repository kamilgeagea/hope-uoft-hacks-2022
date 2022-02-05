// ignore_for_file: use_full_hex_values_for_flutter_colors, constant_identifier_names

import "package:flutter/cupertino.dart";

const kPRIMARY_COLOR = Color(0xFF181818);
const kSECONDARY_COLOR = Color(0xFF2D2D2D);
const kACCENT_COLOR = Color(0xFFD51D8B);

const double kBORDER_RADIUS = 20.0;

class Post {
  final String id;
  final String title;
  final String image;
  final String category;

  Post(
      {required this.id,
      required this.title,
      required this.image,
      required this.category});
}
