import 'package:flutter/material.dart';
import 'package:paisesgui/data/repositories/paises_repository.dart';
import 'package:paisesgui/domain/entities/pais.dart';

class PaisesListScreen extends StatelessWidget {
  final String nombreContinente;
  PaisesListScreen(this.nombreContinente, {super.key});

  // Referencia al repositorio, de donde obtendremos la lista de continentes
  final PaisesRepository _repository = PaisesRepository();


  @override
  Widget build(BuildContext context) {

    // Extraemos el argumento enviado
    // Si por algún motivo llega nulo, le asignamos un valor por defecto Europa
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Paises de $nombreContinente"),
      ),
      body: Center(
          // Proporciona a _creaLlistaPaises la lista de paises de Europa
          child:
              _creaListaPaises(_repository.getPaisesNuevo(nombreContinente))), 
    );
  }

  Widget _creaListaPaises(List<Pais> paises) {
    // Recibimos la lista de paises
    
    // Debemos utilizar un ListView.builder para recorrer la lista de países
    // y generar un widget personalizado de tipo PaisCard, con la imagen y el nombre.

    return ListView.builder(
      itemCount: paises.length,
      itemBuilder: (BuildContext context, int index) {
        return PaisCard(
          imagen: paises[index].imagen ?? "",
          nombre: paises[index].nombre,
        );
      },
    );


  }
}

class PaisCard extends StatelessWidget {
  // Este widget recibirá dos argumentos con nombre para construirse:
  // la imagen (imagen) y el nombre del país (nombre)
  const PaisCard({
    super.key,
    required this.imagen,
    required this.nombre,
  });

  final String imagen;
  final String nombre;

  @override
  Widget build(BuildContext context) {
    // Devuelve un widget de tipo Card, con el diseño que desees, pero
    // que muestre la imagen  (obtenida de Internet a partir de la url)
    // y el nombre del país.

     return Material(
      child: InkWell(
        onTap: () {
          // Navegamos a la ruta '/paises'
          // Enviamos a través de 'arguments' el nombre de este pais específico
          Navigator.pushNamed(
            context, 
            '/infopais', 
            arguments: nombre,
          );
        },
        child: Card(
      //Sin el clip.antiAlias no se muestran los bordes redondeados
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
      ),
      child: Stack(
        children: [
          Image.network(
            imagen,
            //Usamos BoxFit.cover para que la imagen ocupe todo el widget
            fit: BoxFit.cover,
            height: 150,
            //double.infinity hace que ocupe todo el ancho
            width: double.infinity,
            ),
            //Utilizamos el widget Positioned para elegir la posicion del texto con las propiedades bottom y left
            Positioned(
              bottom: 20,
              left: 20,
              child:  Text(nombre, style: Theme.of(context).textTheme.displaySmall,)
            )
         ,
        ],
      ),
    )
      ),
    );    
  }
}
