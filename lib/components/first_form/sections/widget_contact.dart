import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:krasnodar/components/first_form/bloc/first_form_bloc.dart';
import 'package:krasnodar/components/first_form/comp_section_title.dart';
import 'package:krasnodar/models/model_first_form.dart';
import 'package:krasnodar/services/service_first_form.dart';

class WidgetContact extends StatelessWidget {
  const WidgetContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FirstFormBloc, FirstFormState>(
      builder: (context, state) {
        FirstFormBloc bloc = context.read<FirstFormBloc>();
        ModelFirstForm? model;
        List<Contact>? contactList;

        if (state is FirstFormInitial) {
          bloc.add(LoadingDataEvent());
        }

        if (state is FirstFormData) {
          contactList = state.contactList;
        }
        if (state is FirstFormModel) {
          contactList = state.contactList;
          model = state.model;
        }

        List<MyCard> cards = [];

        if (contactList != null) {
          for (final e in contactList) {
            cards.add(MyCard(
              contact: e,
              model: model,
            ));
          }
        }

        return Column(
          children: [
            const CompSectionTitle(
                title: "Выбирете способ связи со специалистом"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: cards,
            ),
          ],
        );
      },
    );
  }
}

class MyCard extends StatelessWidget {
  const MyCard({Key? key, required this.contact, this.model}) : super(key: key);
  final Contact contact;
  final ModelFirstForm? model;

  @override
  Widget build(BuildContext context) {
    bool flag = false;
    if (model != null) {
      if (model!.contact?.id == contact.id) {
        flag = true;
      }
    }

    BorderSide bs = (flag == true)
        ? const BorderSide(color: Color.fromARGB(255, 1, 170, 173), width: 2)
        : const BorderSide(color: Color.fromARGB(0, 1, 170, 173), width: 2);

    return BlocBuilder<FirstFormBloc, FirstFormState>(
      builder: (context, state) {
        FirstFormBloc bloc = context.read<FirstFormBloc>();

        return GestureDetector(
          onTap: () {
            bloc.add(SetModelContactEvent(contact: contact));
          },
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              side: bs,
              borderRadius: BorderRadius.circular(15),
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 3 - 20,
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(contact.image),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    contact.title,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
