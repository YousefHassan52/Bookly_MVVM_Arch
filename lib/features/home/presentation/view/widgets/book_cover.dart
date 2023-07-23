import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class BookCover extends StatelessWidget {
  final String imageUrl;
  const BookCover({
    super.key, required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: AspectRatio(
          aspectRatio: 0.67,
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            errorWidget: (context, url, error) => CachedNetworkImage(imageUrl: "https://i.pinimg.com/564x/6b/c7/05/6bc705248c7675a12162b8de997a877a.jpg"),
          ),
        ),
      ),
    );
  }
}