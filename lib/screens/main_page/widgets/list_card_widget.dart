import 'package:flutter/material.dart';
import 'package:http_sample/model/card.dart';
import 'package:http_sample/screens/login_page/login_screen.dart';

class ListCardWidget extends StatelessWidget {
  final List<CardItemData> cardList;
  const ListCardWidget({super.key, required this.cardList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              itemCount: cardList.length,
              itemBuilder: (crt, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                          return LoginScreen();
                        }));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              width: 75,
                              height: 100,
                              child: Center(
                                child: cardList[index].profileImg != ""
                                    ? FadeInImage(
                                        placeholder: const AssetImage("assets/avatar.jpeg"),
                                        image: NetworkImage(
                                            "https://www.helpera.app/static/mentorsImg/${cardList[index].profileImg!}"),
                                        fit: BoxFit.fill,
                                      )
                                    : const Center(child: CircularProgressIndicator()),
                              ),
                            ),
                            const SizedBox(width: 6),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cardList[index].suffixeName!,
                                ),
                                Text(
                                  cardList[index].firstName!,
                                ),
                                Text(
                                  cardList[index].lastName!,
                                ),
                                const SizedBox(height: 2),
                                Row(
                                  children: [
                                    ClipOval(
                                      child: cardList[index].countryFlag != ""
                                          ? FadeInImage(
                                              width: 20,
                                              height: 20,
                                              fit: BoxFit.cover,
                                              placeholder: const AssetImage("assets/avatar.jpeg"),
                                              image: NetworkImage(
                                                  "https://www.helpera.app/static/countries/${cardList[index].countryFlag!}"),
                                            )
                                          : const Center(child: CircularProgressIndicator()),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      cardList[index].countryName!,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
