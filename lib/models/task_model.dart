class TaskModel {
  int? task_id;
  String? task_name;
  String? task_desc;
  bool? task_state;

  TaskModel({this.task_id, this.task_name, this.task_desc, this.task_state});

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
        task_id: map['task_id'],
        task_name: map['task_name'],
        task_desc: map['task_desc'],
        task_state: map['task_state']);
  }

  //AL PONER LLAVES SON PARAMETROS NOMBRADOS ES DECIR AL ASIGNAR VALOR AL OBJETO ES task_id = x
}
