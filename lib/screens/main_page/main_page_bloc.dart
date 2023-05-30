import 'package:http_sample/model/card.dart';
import 'package:http_sample/model/category.dart';
import 'package:http_sample/utils/http_repository.dart';

class MainPageBloc {
  String selectedId = "1";

  Future<List<Category>?> callGetCategoriesRequest() async {
    final response = await HttpRepository().callRequest(
      requestType: RequestType.get,
      methodName: "categories",
      queryParam: {"lang": "en"},
    );

    Categories data = Categories.fromJson(response);

    return data.data;
  }

  Future<List<CardItemData>?> callGetCardsRequest(String id) async {
    final response = await HttpRepository().callRequest(
      requestType: RequestType.get,
      methodName: "mentor-list/",
      queryParam: {"categories_id": id},
    );

    CardItem data = CardItem.fromJson(response);
    return data.data;
  }
}
