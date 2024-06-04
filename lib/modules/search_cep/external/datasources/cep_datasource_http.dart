import 'package:http/http.dart' as http;
import 'package:volus_app/imports.dart';

class CepDataSourceHttp implements ICepDatasource {
  final http.Client httpClient;

  CepDataSourceHttp(this.httpClient);

  @override
  Future<List<CepEntity>> getFullCep(String uf, String cidade, String logradouro) async {
    try {
      final response = await http.get(Uri.parse(Endpoints.getFullCep(uf, cidade, logradouro)));
      if (response.statusCode == 200) {
        return CepMapper.fromJsonList(response.body);
      } else {
        throw Exception('Failed to load enderecos');
      }
    } catch (e) {
      rethrow;
    }
  }
}
