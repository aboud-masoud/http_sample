class Country {
  List<CountryData?>? mahmoud;
  String? message;

  Country({this.mahmoud, this.message});

  Country.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      mahmoud = [];
      json['data'].forEach((v) {
        mahmoud!.add(CountryData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.mahmoud != null) {
      data['data'] = this.mahmoud!.map((v) => v!.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class CountryData {
  int? id;
  String? flagImage;
  String? name;
  String? currency;
  String? dialCode;
  int? minLength;
  int? maxLength;

  CountryData({this.id, this.flagImage, this.name, this.currency, this.dialCode, this.minLength, this.maxLength});

  CountryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    flagImage = json['flag_image'];
    name = json['name'];
    currency = json['currency'];
    dialCode = json['dialCode'];
    minLength = json['minLength'];
    maxLength = json['maxLength'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['flag_image'] = this.flagImage;
    data['name'] = this.name;
    data['currency'] = this.currency;
    data['dialCode'] = this.dialCode;
    data['minLength'] = this.minLength;
    data['maxLength'] = this.maxLength;
    return data;
  }
}
