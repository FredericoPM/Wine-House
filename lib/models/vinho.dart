class Vinho {
  int _id;
  String nome;
  String tipo;
  int ano;
  String pais;
  String localizacao;
  double nota;
  String comentario;
  bool favorito;

  Vinho({
    id,
    this.nome,
    this.ano,
    this.pais,
    this.tipo,
    this.localizacao,
    this.nota = 0.0,
    this.comentario = "",
    this.favorito = false,
  }){
    _id = id;
    nome = nome[0].toUpperCase() + nome.substring(1);
    pais = pais[0].toUpperCase() + pais.substring(1);
    tipo = tipo[0].toUpperCase() + tipo.substring(1);
    if(localizacao == "")
      localizacao = "Não informada";
    if(ano == -1){
      ano = DateTime.now().year;
    }
  }
  int get id{
    return _id;
  }
  set id(int id){
    _id = id;
  }


  Vinho.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    ano = json['ano'];
    pais = json['pais'];
    tipo = json['tipo'];
    favorito = json['favorito'];
    localizacao = json['localizacao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['ano'] = this.ano;
    data['pais'] = this.pais;
    data['tipo'] = this.tipo;
    data['favorito'] = this.favorito;
    data['localizacao'] = this.localizacao;
    return data;
  }
}
