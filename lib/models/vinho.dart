class Vinho {
  String nome;
  int ano;
  String pais;
  String regiao;
  String produtor;
  List<String> uvas;
  String tipo;
  int teorAlcolico;
  int volume;
  bool favorito = false;

  Vinho({
    this.nome,
    this.ano,
    this.pais,
    this.regiao,
    this.produtor,
    this.uvas,
    this.tipo,
    this.teorAlcolico,
    this.volume
  });

  Vinho.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    ano = json['ano'];
    pais = json['pais'];
    regiao = json['regiao'];
    produtor = json['produtor'];
    uvas = json['uvas'].cast<String>();
    tipo = json['tipo'];
    teorAlcolico = json['teorAlcolico'];
    volume = json['volume'];
    favorito = json['favorito'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['ano'] = this.ano;
    data['pais'] = this.pais;
    data['regiao'] = this.regiao;
    data['produtor'] = this.produtor;
    data['uvas'] = this.uvas;
    data['tipo'] = this.tipo;
    data['teorAlcolico'] = this.teorAlcolico;
    data['volume'] = this.volume;
    data['favorito'] = this.favorito;
    return data;
  }
}
