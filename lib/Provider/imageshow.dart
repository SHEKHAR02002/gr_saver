import 'package:flutter/material.dart';

class ImageShow extends StatefulWidget {
  const ImageShow({super.key});

  @override
  State<ImageShow> createState() => _ImageShowState();
}

class _ImageShowState extends State<ImageShow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Image.network('https://picsum.photos/id/0/5000/3333'),
        ));
  }
}
