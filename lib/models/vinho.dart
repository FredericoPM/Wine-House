class Vinho {
  String nome;
  String tipo;
  int idade;
  String pais;
  String localizacao;

  bool favorito = false;

  Vinho({
    this.nome,
    this.idade,
    this.pais,
    this.tipo,
    this.localizacao,
  });

  Vinho.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    idade = json['idade'];
    pais = json['pais'];
    tipo = json['tipo'];
    favorito = json['favorito'];
    localizacao = json['localizacao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['idade'] = this.idade;
    data['pais'] = this.pais;
    data['tipo'] = this.tipo;
    data['favorito'] = this.favorito;
    data['localizacao'] = this.localizacao;
    return data;
  }
}
