import 'package:flutter/material.dart';

import '../model/estado.dart';
import '../model/municipio.dart';
import '../service/ibge_service.dart';

class MunicipiosView extends StatefulWidget {
  final Estado estado;
  const MunicipiosView(this.estado, {super.key});

  @override
  State<MunicipiosView> createState() => _MunicipiosViewState();
}

class _MunicipiosViewState extends State<MunicipiosView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.estado.nome} (${widget.estado.sigla})'),
      ),
      body: FutureBuilder(
        future: IbgeService().listarMunicipios(widget.estado.sigla),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var lista = snapshot.data as List<Municipio>;
            return ListView.builder(
              itemCount: lista.length,
              itemBuilder: (context, index) {
                return Card(child: ListTile(title: Text(lista[index].nome)));
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
