import 'dart:convert';

class Cliente {
  int? id;
  String nome;
  String sobrenome;
  String cpf;
  Cliente(this.id, this.nome, this.sobrenome, this.cpf);
  Cliente.novo(this.nome, this.sobrenome, this.cpf);
  Map<String, dynamic> toMap() {
    return {
      'cliente_id': this.id,
      'cliente_nome': this.nome,
      'cliente_sobrenome': this.sobrenome,
      'cliente_cpf': this.cpf
    };
  }

  static Cliente fromMap(Map<String, dynamic> map) {
    return Cliente(
      map['cliente_id'],
      map['cliente_nome'],
      map['cliente_sobrenome'],
      map['cliente_cpf'],
    );
  }

  static List<Cliente> fromMaps(List<Map<String, dynamic>> maps) {
    return List.generate(maps.length, (i) {
      return Cliente.fromMap(maps[i]);
    });
  }

  static Cliente fromJson(String j) => Cliente.fromMap(jsonDecode(j));
  static List<Cliente> fromJsonList(String j) {
    final parsed = jsonDecode(j).cast<Map<String, dynamic>>();
    return parsed.map<Cliente>((map) => Cliente.fromMap(map)).toList();
  }

  String toJson() => jsonEncode(toMap());
}
