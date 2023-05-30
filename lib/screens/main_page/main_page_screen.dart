import 'package:flutter/material.dart';
import 'package:http_sample/model/card.dart';
import 'package:http_sample/model/category.dart';
import 'package:http_sample/screens/main_page/main_page_bloc.dart';
import 'package:http_sample/screens/main_page/widgets/list_card_widget.dart';
import 'package:http_sample/screens/main_page/widgets/list_category_widget.dart';

class MainPageScreen extends StatefulWidget {
  const MainPageScreen({super.key});

  @override
  State<MainPageScreen> createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen> {
  final bloc = MainPageBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main Page"),
      ),
      body: Row(
        children: [
          FutureBuilder<List<Category>?>(
              initialData: const [],
              future: bloc.callGetCategoriesRequest(),
              builder: (context, snapshot) {
                return ListCategoryWidget(
                  categories: snapshot.data!,
                  onTap: (id) {
                    print(id);
                    bloc.selectedId = id;
                    setState(() {});
                  },
                );
              }),
          FutureBuilder<List<CardItemData>?>(
              initialData: const [],
              future: bloc.callGetCardsRequest(bloc.selectedId),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListCardWidget(cardList: snapshot.data!);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
        ],
      ),
    );
  }
}
