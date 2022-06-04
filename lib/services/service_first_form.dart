class Service {
  final String name;
  final int price;
  final int id;
  Service({
    required this.id,
    required this.name,
    required this.price,
  });
}

class Contact {
  final int id;
  final String image;
  final String title;
  Contact({
    required this.id,
    required this.image,
    required this.title,
  });
}

class ServiceFirstForm {
  Future<List<Service>> listServices() async {
    List<Service> listServices = [];

    listServices.add(Service(id: 1, name: "Консультация юриста", price: 499));
    listServices
        .add(Service(id: 2, name: "Правовой анализ документов", price: 499));
    listServices
        .add(Service(id: 3, name: "Составление документов", price: 990));

    return listServices;
  }

  List<Contact> listContact() {
    List<Contact> listContact = [];

    listContact
        .add(Contact(id: 1, title: "Аудиозвонок", image: "assets/phone.svg"));
    listContact.add(Contact(id: 2, title: "E-mail", image: "assets/email.svg"));
    listContact.add(Contact(id: 3, title: "Чат", image: "assets/chat.svg"));

    return listContact;
  }
}
