// ignore_for_file: use_full_hex_values_for_flutter_colors, constant_identifier_names

import "package:flutter/cupertino.dart";

const kPRIMARY_COLOR = Color(0xFF181818);
const kSECONDARY_COLOR = Color(0xFF2D2D2D);
const kACCENT_COLOR = Color(0xFFD51D8B);
const kSECONDARY_TEXT_COLOR = Color(0xFF969696);

const double kBORDER_RADIUS = 20.0;

const double kLARGE_FONT = 20;

const SCALE_ANIMATION_STANDARD = 100;
const POP_STANDARD = 130;

class PostItem {
  final String id;
  final String title;
  final String image;
  final String category;
  final String description;

  PostItem(
      {required this.id,
      required this.title,
      required this.image,
      required this.category,
      required this.description});
}

class CommentItem {
  final String id;
  final String userId;
  final String postId;
  final String date;
  final String text;

  CommentItem({
    required this.id,
    required this.userId,
    required this.postId,
    required this.date,
    required this.text,
  });
}
