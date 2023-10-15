import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';
import 'package:project1/database/agendadb.dart';
import 'package:project1/models/teacher_model.dart';
import 'package:project1/styles/global_values.dart';
import 'package:project1/widgets/TeacherWidget.dart';

class TeacherScreen extends StatefulWidget {
  const TeacherScreen({super.key});

  @override
  State<TeacherScreen> createState() => _TeacherScreenState();
}

class _TeacherScreenState extends State<TeacherScreen> {
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
        title: const Text('Teachers Manager'),
        actions: [
          IconButton(
              onPressed: () async {
                var res = await agendadb!.GETALLCAREERS();
                if (res.isEmpty) {
                  ArtSweetAlert.show(
                      context: context,
                      artDialogArgs: ArtDialogArgs(
                          type: ArtSweetAlertType.danger,
                          title: "¡Error!",
                          text:
                              "At least one career must be registered to add teachers"));
                } else {
                  Navigator.pushNamed(context, '/addTeacher');
                }
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
                          agendadb!.GETFILTEREDTEACHERS(searchController.text),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<TeacherModel>> snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return teacherWidget(
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
