import 'package:http_sample/model/country.dart';

class SelectCountryBloc {
  List<Country> countryList = [
    Country(flag: "https://seekflag.com/app/uploads/2021/12/Flag-of-Jordan-01.png", name: "jordan"),
    Country(flag: "https://cdn.britannica.com/73/5773-004-F7C13E3D/Flag-Oman.jpg", name: "Oman"),
    Country(
        flag:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Flag_of_Syria.svg/1280px-Flag_of_Syria.svg.png",
        name: "Syria"),
  ];
}
