import 'package:http_sample/model/country.dart';
import 'package:http_sample/utils/http_repository.dart';

class SelectCountryBloc {
  Future<List<CountryData?>?> callGetCountriesRequest() async {
    final response = await HttpRepository().callRequest(
      requestType: RequestType.get,
      methodName: "countries",
      queryParam: {"limit": 100},
    );

    // print("response");
    // print(response);
    // print("response");

    Country data = Country.fromJson(response);

    return data.mahmoud;
  }
}
