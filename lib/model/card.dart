class CardItem {
  List<CardItemData>? data;
  String? message;

  CardItem({this.data, this.message});

  CardItem.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CardItemData>[];
      json['data'].forEach((v) {
        data!.add(CardItemData.fromJson(v));
      });
    }
    message = json['message'];
  }
}

class CardItemData {
  String? suffixeName;
  String? firstName;
  String? lastName;
  String? profileImg;
  String? countryName;
  String? countryFlag;

  CardItemData({
    this.suffixeName,
    this.firstName,
    this.lastName,
    this.profileImg,
    this.countryName,
    this.countryFlag,
  });

  CardItemData.fromJson(Map<String, dynamic> json) {
    suffixeName = json['suffixe_name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    profileImg = json['profile_img'];
    countryName = json['country_name'];
    countryFlag = json['country_flag'];
  }
}
