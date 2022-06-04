import 'package:bloc/bloc.dart';
import 'package:flutter/semantics.dart';
import 'package:krasnodar/models/model_first_form.dart';
import 'package:krasnodar/services/service_first_form.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'first_form_event.dart';
part 'first_form_state.dart';

class FirstFormBloc extends Bloc<FirstFormEvent, FirstFormState> {
  final ModelFirstForm _model = ModelFirstForm(services: []);
  List<Service>? _serviceList;
  List<Contact>? _contactList;

  FirstFormBloc() : super(FirstFormInitial()) {
    on<FirstFormEvent>((event, emit) async {
      _serviceList = await ServiceFirstForm().listServices();
      _contactList = ServiceFirstForm().listContact();
      if (event is LoadingDataEvent) {
        await onLoadingDataEvent(event, emit);
      }
      if (event is SetModelServiceEvent) {
        onSetModelServiceEvent(event, emit);
      }

      if (event is SetModelContactEvent) {
        onSetModelContactEvent(event, emit);
      }

      if (event is SetModelTextEvent) {
        onSetModelTextEvent(event, emit);
      }
    });
  }

  Future<void> onLoadingDataEvent(
      LoadingDataEvent event, Emitter<FirstFormState> emit) async {
    emit(FirstFormData(serviceList: _serviceList!, contactList: _contactList!));
  }

  void onSetModelServiceEvent(
      SetModelServiceEvent event, Emitter<FirstFormState> emit) async {
    _model.serviceAdd(event.service);

    emit(FirstFormModel(
      model: _model,
      serviceList: _serviceList!,
      contactList: _contactList!,
    ));
  }

  void onSetModelContactEvent(
      SetModelContactEvent event, Emitter<FirstFormState> emit) async {
    _model.contact = event.contact;

    emit(FirstFormModel(
      model: _model,
      serviceList: _serviceList!,
      contactList: _contactList!,
    ));
  }

  void onSetModelTextEvent(
      SetModelTextEvent event, Emitter<FirstFormState> emit) async {
    _model.text = event.text;

    emit(FirstFormModel(
      model: _model,
      serviceList: _serviceList!,
      contactList: _contactList!,
    ));
  }
}
