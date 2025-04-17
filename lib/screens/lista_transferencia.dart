import 'package:flutter/material.dart';
import '../models/transferencia.dart';
import '../components/item_transferencia.dart';
import '../components/my_appbar.dart';
import '../screens/formulario_transferencia.dart';

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferenciasList = [];

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget._transferenciasList.length,
        itemBuilder: (context, index) {
          final transferencia = widget._transferenciasList[index];
          return ItemTransferencia(transferencia);
        },
      ),
      appBar: MyAppBar("Transferências"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<Transferencia?> future = Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return FormularioTransferencia();
              },
            ),
          );
          future.then((transferenciaRecebida) {
            debugPrint('Chegou no Then');
            debugPrint('$transferenciaRecebida');
            if (transferenciaRecebida != null) {
              debugPrint('Não é nulo');
              setState(() {
                widget._transferenciasList.add(transferenciaRecebida);
              });
            }
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
