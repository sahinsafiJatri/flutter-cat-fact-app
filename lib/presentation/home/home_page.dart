import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

part 'home_page_banner.dart';

class HomePage extends StatelessWidget{

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cats facts", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: body()
    );
  }

  final bannerList = [
    "https://static.vecteezy.com/system/resources/previews/027/957/580/non_2x/cute-card-with-cat-free-photo.jpg",
    "https://static.vecteezy.com/system/resources/previews/012/098/088/non_2x/banner-background-cute-cats-say-hello-free-vector.jpg",
    "https://static.vecteezy.com/system/resources/previews/035/381/164/non_2x/ai-generated-a-tabby-cat-looks-up-into-the-sun-free-photo.jpg",
    "https://static.vecteezy.com/system/resources/previews/024/705/172/non_2x/empty-space-background-with-cat-illustration-ai-generative-free-photo.jpg",
    "https://static.vecteezy.com/system/resources/thumbnails/038/954/317/small_2x/ai-generated-stylish-white-cat-with-sunglasses-and-bow-tie-posing-on-a-pink-background-ample-copy-space-on-the-side-photo.jpeg"
  ];

  body() {
    return ListView(
      children: [
        HomePageBanner(bannerList: bannerList)
      ],
    );
  }

}