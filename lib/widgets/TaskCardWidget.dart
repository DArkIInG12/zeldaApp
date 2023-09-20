import 'package:flutter/material.dart';
import 'package:project1/models/task_model.dart';

class TaskCardWidget extends StatelessWidget {
  TaskCardWidget({super.key, required this.taskModel});

  TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [Text(taskModel.task_name!), Text(taskModel.task_desc!)],
        ),
        //Column()
      ],
    );
  }
}
