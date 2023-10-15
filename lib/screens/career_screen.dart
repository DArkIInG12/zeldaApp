import 'package:flutter/material.dart';
import 'package:project1/database/agendadb.dart';
import 'package:project1/models/career_model.dart';
import 'package:project1/styles/global_values.dart';
import 'package:project1/widgets/CareerWidget.dart';

class CareerScreen extends StatefulWidget {
  const CareerScreen({super.key});

  @override
  State<CareerScreen> createState() => _CareerScreenState();
}

class _CareerScreenState extends State<CareerScreen> {
  Agenda? agendadb;
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    agendadb = Agenda();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Careers Manager'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/addCareer');
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: ValueListenableBuilder(
          valueListenable: GlobalValues.flag_database,
          builder: (context, value, _) {
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Search",
                    ),
                    controller: searchController,
                    onChanged: (text) {
                      GlobalValues.flag_database.value =
                          !GlobalValues.flag_database.value;
                    },
                  ),
                ),
                Expanded(
                  child: FutureBuilder(
                      future:
                          agendadb!.GETFILTEREDCAREERS(searchController.text),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<CareerModel>> snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return careerWidget(
                                    snapshot.data![index], context);
                              });
                        } else {
                          if (snapshot.hasError) {
                            return const Center(
                              child: Text("Something Was Wrong"),
                            );
                          } else {
                            return const CircularProgressIndicator();
                          }
                        }
                      }),
                ),
              ],
            );
          }),
    );
  }
}
