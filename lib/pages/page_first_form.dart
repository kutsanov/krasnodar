import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:krasnodar/components/first_form/bloc/first_form_bloc.dart';
import 'package:krasnodar/components/first_form/sections/widget_contact.dart';
import 'package:krasnodar/components/first_form/sections/widget_file.dart';
import 'package:krasnodar/components/first_form/sections/widget_service.dart';
import 'package:krasnodar/components/first_form/sections/widget_text.dart';
import 'package:krasnodar/models/model_first_form.dart';

class PageFirstForm extends StatelessWidget {
  const PageFirstForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => FirstFormBloc(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: BlocBuilder<FirstFormBloc, FirstFormState>(
            builder: (context, state) {
              if (state is FirstFormModel) {
                print(state.model.text);
              }

              return ListView(
                children: const [
                  BtnBack(),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Заполните форму",
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  WidgetService(),
                  WidgetContact(),
                  WidgetText(),
                  WidgetFile(),
                  SizedBox(
                    height: 40,
                  ),
                  BtnOk(),
                  SizedBox(
                    height: 40,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class BtnOk extends StatelessWidget {
  const BtnOk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Color.fromARGB(255, 1, 170, 173),
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
              )),
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Text(
              "Продолжить",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
}

class BtnBack extends StatelessWidget {
  const BtnBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset("assets/icon.svg"),
        const SizedBox(
          width: 5,
        ),
        const Text(
          "Назад",
          style:
              TextStyle(fontSize: 17, color: Color.fromARGB(255, 0, 122, 255)),
        ),
      ],
    );
  }
}
