import 'package:flutter/material.dart';
import 'package:literexia/widgets/CustomNewsfeedCard.dart';
import 'package:literexia/widgets/guid_Widget.dart';

List<Widget> carouselItems() {
  return newsfeedData.map((item) {
    return CustomNewsfeedCard(
      contentText: item['contentText'],
      showContentText: item['showContentText'],
      imageAsset: item['imageAsset'],
      bottomText: item['bottomText'],
    );
  }).toList();
}
