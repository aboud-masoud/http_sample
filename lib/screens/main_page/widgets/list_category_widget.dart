import 'package:flutter/material.dart';
import 'package:http_sample/model/category.dart';
import 'package:http_sample/screens/main_page/main_page_bloc.dart';
import 'package:http_sample/screens/main_page/widgets/category_widget.dart';

class ListCategoryWidget extends StatelessWidget {
  final List<Category> categories;
  final Function(String id) onTap;

  const ListCategoryWidget({super.key, required this.categories, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      color: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: categories.length,
            itemBuilder: (crx, index) {
              return CategoryWidget(
                id: categories[index].id!.toString(),
                name: categories[index].name!,
                image: "https://www.helpera.app/static/categories/${categories[index].icon!}",
                onTap: (id) {
                  onTap(id);
                },
              );
            }),
      ),
    );
  }
}
