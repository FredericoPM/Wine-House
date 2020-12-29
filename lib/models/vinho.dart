class Vinho {
  String nome;
  String tipo;
  int idade;
  String pais;
  String localizacao;
  double nota;
  String comentario;
  bool favorito;

  Vinho({
    this.nome,
    this.idade,
    this.pais,
    this.tipo,
    this.localizacao,
    this.nota = 0.0,
    this.comentario = "",
    this.favorito = false,
  }){
    nome = nome[0].toUpperCase() + nome.substring(1);
    pais = pais[0].toUpperCase() + pais.substring(1);
    tipo = tipo[0].toUpperCase() + tipo.substring(1);
  }



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
