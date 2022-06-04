//import 'package:file_picker/file_picker.dart';

import 'package:flutter/material.dart';
import 'package:krasnodar/components/first_form/comp_section_title.dart';

class WidgetFile extends StatelessWidget {
  const WidgetFile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CompSectionTitle(
          title: "Прикрепить файлы",
          icon: "assets/screpka.svg",
        ),
        Row(
          children: [
            BtnAdd(),
          ],
        )
      ],
    );
  }
}

class BtnAdd extends StatelessWidget {
  const BtnAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () async {
        // FilePickerResult? result = await FilePicker.platform.pickFiles();

        // if (result != null) {
        //   print(result);
        //   //File file = File(result.files.single.path);
        // } else {
        //   // User canceled the picker
        // }
      },
      elevation: 2.0,
      fillColor: Color.fromARGB(255, 243, 108, 53),
      child: Icon(
        Icons.add,
        color: Colors.white,
        size: 30.0,
      ),
      padding: EdgeInsets.all(10.0),
      shape: CircleBorder(),
    );
  }
}
