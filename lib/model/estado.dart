class Estado {
  final int id;
  final String sigla;
  final String nome;
  final String regiao;

  Estado(
    this.id,
    this.sigla,
    this.nome,
    this.regiao,
  );

  factory Estado.fromJson(Map json){
    return Estado(
      json['id'],
      json['sigla'],
      json['nome'],
      json['regiao']['nome'],
    );
  }
}
