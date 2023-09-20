import 'package:flutter/material.dart';
import 'package:project1/database/agendadb.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String dropDownValue = "Pendiente";
  TextEditingController txtContTaskName = TextEditingController();
  TextEditingController txtContTaskDesc = TextEditingController();
  List<String> dropDownValues = ["Pendiente", "Finalizado", "En Proceso"];
  Agenda? agendadb;

  @override
  void initState() {
    super.initState();
    agendadb = Agenda();
  }

  @override
  Widget build(BuildContext context) {
    final txtTaskName = TextFormField(
      decoration: const InputDecoration(
          border: OutlineInputBorder(), label: Text("Name")),
      controller: txtContTaskName,
    );

    final txtTaskDesc = TextField(
      decoration: const InputDecoration(
          border: OutlineInputBorder(), label: Text("Description")),
      maxLines: 6,
      controller: txtContTaskDesc,
    );

    const space = SizedBox(
      height: 10,
    );

    final DropdownButton dropDownButtonStatus = DropdownButton(
        value: dropDownValue,
        items: dropDownValues
            .map((status) =>
                DropdownMenuItem(value: status, child: Text(status)))
            .toList(),
        onChanged: (value) {
          dropDownValue = value;
          setState(() {});
        });

    final ElevatedButton btnSave = ElevatedButton(
        onPressed: () {
          agendadb!.INSERT('tasks', {
            "task_name": txtContTaskName.text,
            "task_desc": txtContTaskDesc.text,
            "task_state": dropDownValue.substring(1, 1)
          }).then((value) {
            var msj =
                (value > 0) ? 'Task Added Succesfully' : 'Something Was Wrong';
            var snackBar = SnackBar(content: Text(msj));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            txtContTaskName.text = "";
            txtContTaskDesc.text = "";
            Navigator.pop(context);
          });
        },
        child: const Text("Save Task"));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            txtTaskName,
            space,
            txtTaskDesc,
            space,
            dropDownButtonStatus,
            space,
            btnSave
          ],
        ),
      ),
    );
  }
}
