import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/estado.dart';
import '../model/municipio.dart';

class IbgeService {
  //
  // RETORNA uma lista de estados
  //
  Future<List<Estado>> listarEstados() async {
    http.Response resposta = await http.get(
      Uri.parse(
        'https://servicodados.ibge.gov.br/api/v1/localidades/estados/?orderby=nome',
      ),
    );

    try {
      if (resposta.statusCode == 200) {
        Iterable lista = json.decode(resposta.body);
        return lista.map((modelo) => Estado.fromJson(modelo)).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  //
  // RETORNA uma lista de municípios a partir do estado
  //
  Future<List<Municipio>> listarMunicipios(String sigla) async {
    http.Response resposta = await http.get(
      Uri.parse(
        'https://servicodados.ibge.gov.br/api/v1/localidades/estados/$sigla/municipios?orderby=nome',
      ),
    );

    if (resposta.statusCode == 200) {
      Iterable lista = json.decode(resposta.body);
      return lista.map((modelo) => Municipio.fromJson(modelo)).toList();
    } else {
      return [];
    }
  }
}
