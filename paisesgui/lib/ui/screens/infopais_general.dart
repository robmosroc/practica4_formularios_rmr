import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paisesgui/data/repositories/paises_repository.dart';
import 'package:paisesgui/domain/entities/pais.dart';

class InfoPaisGeneral extends StatelessWidget {
  final String nombrePais;
  InfoPaisGeneral(this.nombrePais, {super.key});

  // Referencia al repositorio, de donde obtendremos la lista de continentes
  final PaisesRepository _repository = PaisesRepository();

  @override
  Widget build(BuildContext context) {
    // Recogemos el país del repositorio
    Pais pais = _repository.infoPaisNuevo(nombrePais);

    // TO-DO
    // Añadir la información siguiente sobre el país:
    // Imagen, nombre, capital y descripción, de forma similar a como se muestra en el enunciado

    // Podéis utilizar los widgets y contenedores que consideréis oportunos (Containers, SingleChildScrollView, Columns, etc)
    // Debéis tener en cuenta no sobrepasar los límites y dibujar fuera del espacio disponible
    // Para comprobar que no os salís, podéis probar a girar el dispositivo (si lo estáis haciendo sobre Android)

    return Scaffold(
      appBar: AppBar(title: Text("Información de $nombrePais")),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(pais.imagen ?? "", width: 750),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      pais.nombre,
                    ),
                    Text(
                      style: TextStyle(
                        fontSize: 20,
                        color: CupertinoColors.inactiveGray,
                      ),
                      "Capital: ${pais.capital ?? ''}",
                    ),
                    SizedBox(height: 20),
                    Text(textAlign: TextAlign.justify, pais.descripcion ?? ""),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
