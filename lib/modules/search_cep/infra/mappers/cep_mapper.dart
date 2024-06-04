import 'dart:convert';

import 'package:volus_app/imports.dart';

class CepMapper {
  static CepEntity fromMap(Map<String, dynamic> map) {
    return CepEntity(
      cep: map["cep"],
      logradouro: map["logradouro"],
      complemento: map["complemento"],
      bairro: map["bairro"],
      localidade: map["localidade"],
      uf: map["uf"],
      ddd: map["ddd"],
      ibge: map["ibge"],
      gia: map["gia"],
      siafi: map["siafi"],
    );
  }

  static List<CepEntity> fromJsonList(String source) {
    final object = jsonDecode(source);
    List entities = object is List ? object : object['items'] ?? [];
    return entities
        .map((e) => e is String ? fromMap(jsonDecode(e)) : fromMap(e))
        .toList();
  }
}
