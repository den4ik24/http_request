import 'package:flutter/material.dart';
import 'package:http_request/API/get_user_data.dart';

class DataFromAPI extends StatefulWidget {
  const DataFromAPI({super.key});

  @override
  State<DataFromAPI> createState() => _DataFromAPI();
}

class _DataFromAPI extends State<DataFromAPI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UserData"),
      ),
      body: Card(
        child: FutureBuilder(
          future: getUserData(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                    Center(
                      child: Text("Loading..."),
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    leading: Text(snapshot.data[i].id),
                    title: Text(snapshot.data[i].name),
                    trailing: Image.network(snapshot.data[i].avatar),
                    subtitle: Text(snapshot.data[i].createdAt),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
