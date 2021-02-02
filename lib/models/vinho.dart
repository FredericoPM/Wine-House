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
    safra = json['safra'];
    pais = json['pais'];
    tipo = json['tipo'];
    favorito = json['favorito'] == "true";
    etiqueta = json['etiqueta'];
    notaRP = json['notaRP'];
    notaWS = json['notaWS'];
    _id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['safra'] = this.safra;
    data['pais'] = this.pais;
    data['tipo'] = this.tipo;
    data['favorito'] = this.favorito.toString();
    data['etiqueta'] = this.etiqueta;
    data['notaRP'] = this.notaRP;
    data['notaWS'] = this.notaWS;
    if(this._id != null)
      data['id'] = this._id;
    return data;
  }
}
