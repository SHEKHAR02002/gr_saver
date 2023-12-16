import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gr_saver/Provider/imageshow.dart';

class GridViewExample extends StatelessWidget {
  final List<String> items;

  const GridViewExample({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ImageShow())),
          child: Column(
            children: [
              Icon(CupertinoIcons.doc_fill,
                  color: Colors.blue.shade100, size: 70),
              const Text("GR Name")
            ],
          ),
        );
      },
    );
  }
}
