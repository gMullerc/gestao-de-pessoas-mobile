class InputValidator {
  InputValidator();

  bool validateMyCpf(String value) {
    Pattern pattern = r"(^\\d{3}\\x2E\\d{3}\\x2E\\d{3}\\x2D\\d{2}$)";
    RegExp regex = RegExp(pattern.toString());
    if (!regex.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }

  bool validateMyRg(String value) {
    Pattern pattern = r"(\d{1,2}).?(\d{3}).?(\d{3})-?(\d{1}|X|x$)";

    RegExp regex = RegExp(pattern.toString());
    if (!regex.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }

  validadeForm(String value, String validate) {
    switch (validate) {
      case 'cpf':
        Pattern pattern = r"(^\d{3}\x2E\d{3}\x2E\d{3}\x2D\d{2}$)";
        RegExp regex = RegExp(pattern.toString());
        if (!regex.hasMatch(value)) {
          return false;
        }
        break;
      case 'rg':
        Pattern pattern = r"(\d{1,2}).?(\d{3}).?(\d{3})-?(\d{1}|X|x$)";
        RegExp regex = RegExp(pattern.toString());
        if (!regex.hasMatch(value)) {
          return false;
        }
        break;
      case 'celular':
        Pattern pattern = r"(^[0-9]{2})?(\\s|-)?(9?[0-9]{5})-?([0-9]{4}$)";
        RegExp regex = RegExp(pattern.toString());
        if (!regex.hasMatch(value)) {
          return false;
        }
        break;
      case 'telefone':
        Pattern pattern = r"(^[0-9]{2})?(\\s|-)?(9?[0-9]{4})-?([0-9]{4}$)";
        RegExp regex = RegExp(pattern.toString());
        if (!regex.hasMatch(value)) {
          return false;
        }
        break;

      case 'cep':
        Pattern pattern = r"\d{3}[.\s]?\d{3}[.\s]?\d{3}[-.\s]?\d{2}";
        RegExp regex = RegExp(pattern.toString());
        if (!regex.hasMatch(value)) {
          return true;
        }
        break;
      default:
        return true;
    }
    Pattern pattern = r"(\d{1,2}).?(\d{3}).?(\d{3})-?(\d{1}|X|x$)";

    RegExp regex = RegExp(pattern.toString());
    if (!regex.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }
}
