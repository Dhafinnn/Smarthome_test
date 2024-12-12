import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

Widget slider(String gambar) {
  return SizedBox(
    width: double.infinity,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: CachedNetworkImage(
          imageUrl: gambar,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    ),
  );
}

Widget slide() {
  List<Widget> list = [
    slider(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJMTplnMFRMUpoW3otNiJ1L1LviH3GOXKcZw&s"),
    slider(
        "https://images.genius.com/8098c49c8d5cf6d1326581bc73416f6e.1000x563x1.jpg"),
    slider(
        "https://images.genius.com/d388370acbd777222e23d90363e43140.1000x563x1.jpg"),
  ];
  return SizedBox(
    width: double.infinity,
    height: 200,
    child: CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        viewportFraction: 0.8,
        enlargeCenterPage: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(seconds: 1),
      ),
      items: list.map((item) => item).toList(),
    ),
  );
}
