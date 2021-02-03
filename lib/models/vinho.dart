class Vinho {
  int _id;
  String nome;
  String pais;
  String regiao;
  String tipo;
  int safra;
  num notaRP;
  num notaWS;
  String beberRP;
  num quantidade;
  String etiqueta;
  bool favorito;

  Vinho({
    id,
    this.nome,
    this.pais,
    this.regiao,
    this.tipo,
    this.safra,
    this.notaRP = 0,
    this.notaWS = 0,
    this.beberRP,
    this.quantidade = 1,
    this.etiqueta,
    this.favorito = false,
  }){
    _id = id;
    nome = nome[0].toUpperCase() + nome.substring(1);
    pais = pais[0].toUpperCase() + pais.substring(1);
    tipo = tipo[0].toUpperCase() + tipo.substring(1);
    regiao = regiao[0].toUpperCase() + regiao.substring(1);
    if(etiqueta == "")
      etiqueta = "Não informada";
    if(safra == -1){
      safra = DateTime.now().year;
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
    pais = json['pais'];
    regiao = json['regiao'];
    tipo = json['tipo'];
    safra = json['safra'];
    notaRP = json['notaRP'];
    notaWS = json['notaWS'];
    beberRP = json['beberRP'];
    quantidade = json['quantidade'];
    etiqueta = json['etiqueta'];
    favorito = json['favorito'] == "true";
    _id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['pais'] = this.pais;
    data['regiao'] = this.regiao;
    data['tipo'] = this.tipo;
    data['safra'] = this.safra;
    data['etiqueta'] = this.etiqueta;
    data['notaRP'] = this.notaRP;
    data['notaWS'] = this.notaWS;
    data['beberRP'] = this.beberRP;
    data['quantidade'] = this.quantidade;
    data['etiqueta'] = this.etiqueta;
    data['favorito'] = this.favorito.toString();
    if(this._id != null)
      data['id'] = this._id;
    return data;
  }
}
