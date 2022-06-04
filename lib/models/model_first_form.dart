import 'package:krasnodar/services/service_first_form.dart';

class ModelFirstForm {
  List<Service> services;
  Contact? contact;
  String? text;
  ModelFirstForm({required this.services, this.contact});

  void serviceAdd(Service service) {
    int id = service.id;
    bool flagAdd = true;
    List<Service> servicesNew = [];
    for (Service s in services) {
      if (s.id == id) {
        flagAdd = false;
      } else {
        servicesNew.add(s);
      }
    }

    if (flagAdd == true) {
      servicesNew.add(service);
    }
    services = servicesNew;
  }
}
