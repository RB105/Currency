import 'package:currency/model/currency_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: FutureBuilder(
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot is String) {
            return Center(
              child: Text(snapshot.data.toString()),
            );
          } else {
            List<CurrencyModel> data = snapshot.data as List<CurrencyModel>;
            return ListView.builder(itemBuilder: (context, index) {
              return ListTile(
                title: Text(data[index].title.toString()),
                subtitle: Text(data[index].cbPrice.toString()),
              );
            },);
          }
        },
      ),
    );
  }
}
