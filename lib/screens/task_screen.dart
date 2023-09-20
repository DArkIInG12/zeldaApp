import 'package:flutter/material.dart';
import 'package:project1/database/agendadb.dart';
import 'package:project1/models/task_model.dart';
import 'package:project1/widgets/TaskCardWidget.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  Agenda? agendadb;
  @override
  void initState() {
    super.initState();
    agendadb = Agenda();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Manager'),
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, '/addTask')
                  .then((value) => setState(() {})),
              icon: const Icon(Icons.task))
        ],
      ),
      body: FutureBuilder(
          future: agendadb!.GETALLTASKS(),
          builder:
              (BuildContext context, AsyncSnapshot<List<TaskModel>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return TaskCardWidget(
                      taskModel: snapshot.data![index],
                    );
                  });
            } else {
              if (snapshot.hasError) {
                return const Center(
                  child: Text('Something Was Wrong'),
                );
              } else {
                return const CircularProgressIndicator();
              }
            }
          }),
    );
  }
}
