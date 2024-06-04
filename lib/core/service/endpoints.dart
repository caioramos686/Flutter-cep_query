abstract class Endpoints {
  static String getFullCep(String uf, String cidade, String logradouro) =>
      'https://viacep.com.br/ws/$uf/$cidade/$logradouro/json';
}
