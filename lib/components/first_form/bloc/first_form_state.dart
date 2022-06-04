part of 'first_form_bloc.dart';

@immutable
abstract class FirstFormState {}

class FirstFormInitial extends FirstFormState {}

class FirstFormData extends FirstFormState {
  final List<Service> serviceList;
  final List<Contact> contactList;

  FirstFormData({required this.serviceList, required this.contactList});
}

class FirstFormModel extends FirstFormState {
  final ModelFirstForm model;
  final List<Service> serviceList;
  final List<Contact> contactList;

  FirstFormModel({
    required this.model,
    required this.serviceList,
    required this.contactList,
  });
}
