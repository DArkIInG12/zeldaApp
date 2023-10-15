import 'package:flutter/material.dart';
import 'package:project1/models/popular_model.dart';
import 'package:project1/network/api_popular.dart';
import 'package:project1/widgets/MovieWidget.dart';

class PopularScreen extends StatefulWidget {
  const PopularScreen({super.key});

  @override
  State<PopularScreen> createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {
  ApiPopular? api;
  @override
  void initState() {
    api = ApiPopular();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Popular Movies"),
      ),
      body: FutureBuilder(
          future: api!.getAllPopular(),
          builder: (context, AsyncSnapshot<List<PopularModel>?> snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.9),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return movieWidget(snapshot.data![index], context);
                },
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Algo salio mal :C'),
              );
            } else {
              return const CircularProgressIndicator();
            }
          }),
    );
  }
}
