import 'package:flutter/material.dart';
import '../components/editor.dart';
import '../components/my_appbar.dart';
import '../models/transferencia.dart';

class FormularioTransferencia extends StatefulWidget {
  final TextEditingController _controllerCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controllerCampoValor = TextEditingController();

  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('Nova transferência'),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controller: widget._controllerCampoNumeroConta,
              label: 'Numero da conta',
              placeholder: '1234',
            ),
            Editor(
              controller: widget._controllerCampoValor,
              label: 'Valor',
              placeholder: 'RS 0',
              icon: Icons.monetization_on,
            ),
            FilledButton(
              onPressed: () {
                final int? numeroConta = int.tryParse(
                  widget._controllerCampoNumeroConta.text,
                );
                final double? valor = double.tryParse(
                  widget._controllerCampoValor.text,
                );

                if (numeroConta != null && valor != null) {
                  final transferenciaCriada = Transferencia(valor, numeroConta);
                  debugPrint('Criando transferência');
                  debugPrint('$transferenciaCriada'.toString());
                  Navigator.pop(context, transferenciaCriada);
                }
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(150, 40), // Width: 200, Height: 50
              ),
              child: Text('Confirmar'),
            ),
          ],
        ),
      ),
    );
  }
}
