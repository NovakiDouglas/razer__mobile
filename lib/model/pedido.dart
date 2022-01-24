class Pedido {
  int? id;
  DateTime data;
  int idCliente;

  Pedido(this.id, this.data, this.idCliente);
  Pedido.novo(this.data, this.idCliente);
}
