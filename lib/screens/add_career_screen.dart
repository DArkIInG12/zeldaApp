import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';
import 'package:project1/database/agendadb.dart';
import 'package:project1/models/career_model.dart';
import 'package:project1/styles/global_values.dart';

class AddCareerScreen extends StatefulWidget {
  AddCareerScreen({super.key, this.careerModel});

  CareerModel? careerModel;

  @override
  State<AddCareerScreen> createState() => _AddCareerScreenState();
}

class _AddCareerScreenState extends State<AddCareerScreen> {
  TextEditingController txtContCareerName = TextEditingController();
  Agenda? agendadb;

  @override
  void initState() {
    super.initState();
    agendadb = Agenda();
    txtContCareerName.text =
        widget.careerModel == null ? "" : widget.careerModel!.career_name!;
  }

  @override
  Widget build(BuildContext context) {
    final txtCareerName = TextFormField(
      decoration: const InputDecoration(
          border: OutlineInputBorder(), label: Text("Career Name")),
      controller: txtContCareerName,
    );

    final btnSave = ElevatedButton(
        onPressed: () {
          if (widget.careerModel == null) {
            if (txtContCareerName.text == "") {
              ArtSweetAlert.show(
                  context: context,
                  artDialogArgs: ArtDialogArgs(
                      type: ArtSweetAlertType.warning,
                      title: "¡Warning!",
                      text: "Please fill all fields"));
            } else {
              agendadb!.INSERT('careers',
                  {'career_name': txtContCareerName.text}).then((value) {
                var msj = (value > 0)
                    ? 'Career Added Succesfully'
                    : 'Something Was Wrong';
                var snackBar = SnackBar(content: Text(msj));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                Navigator.pop(context);
              });
            }
          } else {
            agendadb!.UPDATE('careers', 'career_id', {
              "career_id": widget.careerModel!.career_id,
              "career_name": txtContCareerName.text
            }).then((value) {
              var msj = (value > 0)
                  ? 'Career Updated Succesfully'
                  : 'Something Was Wrong';
              var snackBar = SnackBar(content: Text(msj));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              Navigator.pop(context);
            });
          }
          GlobalValues.flag_database.value = !GlobalValues.flag_database.value;
        },
        child: const Text("Save"));

    const space = SizedBox(
      height: 10,
    );

    return Scaffold(
      appBar: AppBar(
        title: widget.careerModel == null
            ? const Text('Add Career')
            : const Text('Update Career'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [txtCareerName, space, btnSave],
        ),
      ),
    );
  }
}
