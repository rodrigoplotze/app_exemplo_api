class Municipio {
  final int id;
  final String nome;

  Municipio(
    this.id,
    this.nome,
  );

  factory Municipio.fromJson(Map json){
    return Municipio(
      json['id'],
      json['nome'],
    );
  }
}
