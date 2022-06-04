import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krasnodar/components/first_form/bloc/first_form_bloc.dart';
import 'package:krasnodar/components/first_form/comp_section_title.dart';
import 'package:krasnodar/models/model_first_form.dart';
import 'package:krasnodar/services/service_first_form.dart';

class WidgetService extends StatelessWidget {
  const WidgetService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FirstFormBloc, FirstFormState>(
      builder: (context, state) {
        FirstFormBloc bloc = context.read<FirstFormBloc>();

        List<Service> serviceList = [];
        ModelFirstForm? model;

        if (state is FirstFormInitial) {
          bloc.add(LoadingDataEvent());
        }

        if (state is FirstFormData) {
          serviceList = state.serviceList;
        }
        if (state is FirstFormModel) {
          serviceList = state.serviceList;
          model = state.model;
        }

        List<MyCard> cards = [];

        for (final e in serviceList) {
          cards.add(MyCard(
            service: e,
            model: model,
          ));
        }

        return Column(
          children: [
            const CompSectionTitle(title: "Выбирете одну или несколько услуг"),
            ...cards,
          ],
        );
      },
    );
  }
}

class MyCard extends StatelessWidget {
  const MyCard({Key? key, required this.service, this.model}) : super(key: key);

  final Service service;
  final ModelFirstForm? model;

  @override
  Widget build(BuildContext context) {
    bool flag = false;
    if (model != null) {
      for (Service m in model!.services) {
        if (m.id == service.id) {
          flag = true;
        }
      }
    }

    BorderSide bs = (flag == true)
        ? const BorderSide(color: Color.fromARGB(255, 1, 170, 173), width: 2)
        : const BorderSide(color: Color.fromARGB(0, 1, 170, 173), width: 2);

    return BlocBuilder<FirstFormBloc, FirstFormState>(
      builder: (context, state) {
        FirstFormBloc bloc = context.read<FirstFormBloc>();

        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: GestureDetector(
            onTap: () {
              bloc.add(SetModelServiceEvent(service: service));
            },
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                side: bs,
                borderRadius: BorderRadius.circular(15),
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 220,
                        child: Text(
                          service.name,
                          softWrap: true,
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: Text(
                          "${service.price}₽",
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
