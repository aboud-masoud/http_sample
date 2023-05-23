import 'package:flutter/material.dart';
import 'package:http_sample/screens/select_country/select_country_bloc.dart';

class SelectCountryScreen extends StatelessWidget {
  SelectCountryScreen({super.key});

  var bloc = SelectCountryBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                "Select Country",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: bloc.countryList.length,
                itemBuilder: (contextt, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 60,
                      color: Colors.white,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Image.network(
                              bloc.countryList[index].flag,
                              width: 30,
                            ),
                          ),
                          Text(bloc.countryList[index].name),
                          Expanded(child: Container()),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
