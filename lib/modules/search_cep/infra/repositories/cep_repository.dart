import 'package:volus_app/imports.dart';

class CepRepository implements ICepRepository {
  final ICepDatasource datasource;

  CepRepository(this.datasource);

  @override
  Future<List<CepEntity>> getFullCep(
      String uf, String cidade, String logradouro) async {
    try {
      final response = await datasource.getFullCep(uf, cidade, logradouro);
      return response;
    } catch (e, s) {
      throw CepInfraException(e, s);
    }
  }
}
