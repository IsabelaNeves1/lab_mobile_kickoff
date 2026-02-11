import 'package:flutter/material.dart';
import 'data/servico_repository.dart';
import 'domain/models/servico_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab Mobile Kickoff',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ListaServicosScreen(),
    );
  }
}

class ListaServicosScreen extends StatefulWidget {
  const ListaServicosScreen({super.key});

  @override
  State<ListaServicosScreen> createState() => _ListaServicosScreenState();
}

class _ListaServicosScreenState extends State<ListaServicosScreen> {
  // Instanciando o repositório que você criou na pasta data
  final ServicoRepository _repository = ServicoRepository();

  @override
  Widget build(BuildContext context) {
    // Buscando a lista do repositório
    final servicos = _repository.listarTodos();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Serviços'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: servicos.isEmpty
          ? const Center(child: Text('Nenhum serviço encontrado (Lista Vazia).'))
          : ListView.builder(
              itemCount: servicos.length,
              itemBuilder: (context, index) {
                final servico = servicos[index];
                return ListTile(
                  leading: const Icon(Icons.settings),
                  title: Text(servico.titulo),
                  subtitle: Text(servico.descricao),
                );
              },
            ),
    );
  }
}