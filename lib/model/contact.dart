class Contact {
  late int id;
  late String email;
  late String telefone;
  late String celular;

  Contact();
  Contact.attributes(
      {required this.id,
      required this.email,
      required this.telefone,
      required this.celular});
}
