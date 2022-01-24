import 'package:flutter/material.dart';
import 'package:razer__mobile/view/cliente/editar_cliente_page.dart';
import 'package:razer__mobile/view/cliente/inserir_cliente_page.dart';
import 'package:razer__mobile/view/cliente/listar_cliente_page.dart';

import 'routes/routes.dart';
import 'widgets/drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'CRUD Razer'),
      routes: {
        Routes.editCliente: (context) => EditarClientePage(),
        Routes.insertCliente: (context) => InserirClientePage(),
        Routes.listCliente: (context) => ListarClientePage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: AppDrawer(),
    );
  }
}
