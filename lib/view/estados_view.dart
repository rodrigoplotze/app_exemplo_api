import 'package:flutter/material.dart';

import '../model/estado.dart';
import '../service/ibge_service.dart';
import 'municipios_view.dart';

class EstadosView extends StatefulWidget {
  const EstadosView({super.key});

  @override
  State<EstadosView> createState() => _EstadosViewState();
}

class _EstadosViewState extends State<EstadosView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: IbgeService().listarEstados(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var lista = snapshot.data as List<Estado>;
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: lista.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: InkWell(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            lista[index].sigla,
                            style: TextStyle(fontSize: 44),
                          ),
                          Text(lista[index].nome),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MunicipiosView(lista[index]),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
