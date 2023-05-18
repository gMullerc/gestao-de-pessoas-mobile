import 'package:my_app/model/address.dart';
import 'package:my_app/model/contact.dart';
import 'package:my_app/model/documents.dart';
import 'package:my_app/model/professional.dart';
import 'package:my_app/model/professional_documentes.dart';

var professionalList = [
  Professional.attributes(
    id: 1,
    name: "Igor Birilosh da silva",
    dataDeNascimento: "01/08/2022",
    genero: "MASCULINO",
    etnia: "PARDO",
    contato: Contact.attributes(
        id: 1,
        email: "igor@gmail.com",
        telefone: "(11) 985421298",
        celular: "(11) 5512-0429"),
    endereco: Address.attributes(
      id: 1,
      logradouro: "Chinigua",
      bairro: "Inga",
      cep: "05736100",
      numero: "A",
      complemento: "",
      cidade: "São Paulo",
      uf: "SP",
      //pais: "Brasil"
    ),
    imagem: "assets/images/IGOR.jpeg",
    situacaoEscolar: "CURSANDO",
    documentos: Documents.attributes(
        cpf: "314.488.896-85",
        rg: "55.987.787-X",
        certidaoDeNascimento: "12344/8454"),
    escolaridade: "MEDIO",
    cargo: "Desenvolvedor trainee",
    remuneracao: "2200.00",
    tipoDeProfissional: "CLT",
    professionalDocuments: ProfessionalDocuments.attributes("12331", "333222"),
  ),
  Professional.attributes(
    id: 2,
    name: "Igor Birilosh da silva",
    dataDeNascimento: "01/08/2022",
    genero: "MASCULINO",
    etnia: "PARDO",
    contato: Contact.attributes(
        id: 1,
        email: "igor@gmail.com",
        telefone: "(11) 985421298",
        celular: "(11) 5512-0429"),
    endereco: Address.attributes(
      id: 1,
      logradouro: "Chinigua",
      bairro: "Inga",
      cep: "05736100",
      numero: "A",
      complemento: "",
      cidade: "São Paulo",
      uf: "SP",
      //pais: "Brasil"
    ),
    imagem: "assets/images/ISA.jpeg",
    situacaoEscolar: "CURSANDO",
    documentos: Documents.attributes(
        cpf: "314.488.896-85",
        rg: "55.987.787-X",
        certidaoDeNascimento: "12344/8454"),
    escolaridade: "MEDIO",
    cargo: "Desenvolvedor trainee",
    remuneracao: "2200.00",
    tipoDeProfissional: "CLT",
    professionalDocuments: ProfessionalDocuments.attributes("12331", "333222"),
  ),
];
