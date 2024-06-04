import 'package:volus_app/imports.dart';

abstract class ICepDatasource {
  Future<List<CepEntity>> getFullCep(String uf, String cidade, String logradouro);
}