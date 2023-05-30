import 'package:flutter/material.dart';

class CategoryWidget extends StatefulWidget {
  final String id;

  final String name;
  final String image;

  final Function(String id) onTap;
  const CategoryWidget({super.key, required this.name, required this.image, required this.id, required this.onTap});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap(widget.id);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.white,
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.network(
                  widget.image,
                  height: 50,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.name,
                  style: TextStyle(fontSize: 10),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
