import '../domain/models/servico_model.dart';

class ServicoRepository {

  final List<ServicoModel> _servicos = [];

  List<ServicoModel> listarTodos() {
    return _servicos;
  }

  void adicionar(ServicoModel servico) {
    _servicos.add(servico);
  }
}