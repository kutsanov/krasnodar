import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krasnodar/components/first_form/bloc/first_form_bloc.dart';
import 'package:krasnodar/components/first_form/comp_section_title.dart';

class WidgetText extends StatelessWidget {
  const WidgetText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FirstFormBloc, FirstFormState>(
      builder: (context, state) {
        FirstFormBloc bloc = context.read<FirstFormBloc>();

        return Column(
          children: [
            const CompSectionTitle(title: "Подробно опишите что произошло"),
            TextField(
              onChanged: (str) {
                bloc.add(SetModelTextEvent(text: str));
              },
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
