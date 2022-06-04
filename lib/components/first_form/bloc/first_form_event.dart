part of 'first_form_bloc.dart';

@immutable
abstract class FirstFormEvent {}

class LoadingDataEvent extends FirstFormEvent {}

class SetModelServiceEvent extends FirstFormEvent {
  final Service service;
  SetModelServiceEvent({
    required this.service,
  });
}

class SetModelContactEvent extends FirstFormEvent {
  final Contact contact;
  SetModelContactEvent({
    required this.contact,
  });
}

class SetModelTextEvent extends FirstFormEvent {
  final String text;
  SetModelTextEvent({
    required this.text,
  });
}
