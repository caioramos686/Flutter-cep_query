final regExp = RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]');

String? cepValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Campo obrigatório';
  }
  if (regExp.hasMatch(value)) {
    return 'Nome invalido';
  }
  return null;
}