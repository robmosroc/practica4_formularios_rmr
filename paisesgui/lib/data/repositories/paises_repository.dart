// Define el repositorio de acceso a los datos
// Esta capa es la que se usa desde la aplicación para abstraer
// el acceso a los datos.
// Hemos cambiado el repositorio. 
// Ahora en vez de obtenerlo de la clase PaisesApi lo obtenemos de PaisesEjemplo


import 'package:paisesgui/data/services/paises_ejemplo.dart';
import 'package:paisesgui/data/services/paises_ejemplo_nuevo.dart';
import 'package:paisesgui/domain/entities/continente.dart';
import 'package:paisesgui/domain/entities/pais.dart';

class PaisesRepository {
  // Con late indicamos que este valor 
  // se inicializar posteriormente (en el constructor)
  late PaisesEjemplo api;
  late PaisesEjemploNuevo apiNueva;

  PaisesRepository() {
    api = PaisesEjemplo();
    apiNueva = PaisesEjemploNuevo();
  }

  List<Continente> getContinentes() {
    // Opción 1: Recorrido clásico de listas y creación de elementos
    /*
    // Definimos una lista de continentes en formato JSON (como los devuelve la API)
    List<dynamic> continentesJSON;
    continentesJSON = api.getContinentes();

    // Definimos una lista de objetos de tipo Continente (como necesita la app)
    List<Continente> lista_continentes = [];
    // Recorremos la lista JSON y generamos Continente para cada elemento de esta
    // en la lista de continentes (hacemos uso del método fromJSON para ello)
    for (Map<String, dynamic> continenteJSON in continentesJSON) {
      lista_continentes.add(Continente.fromJSON(continenteJSON));
    }

    return llista_continente;
*/

    // Opción 2. Hacer uso del mapeado de estructuras
    // La función .map nos devuelve un Iterable, por lo que
    // lo hemos de convertir a lista con toList().
    return (api.getContinentes()).map((continente) {
      return Continente.fromJSON(continente);
    }).toList();
  }


  List<Pais> getPaises(){
    return (api.getPaises()).map((pais) {
          return Pais.fromJSON(pais);
        }).toList();
  }    

  // Implementar el método infoPais
  Pais infoPais() {
    return Pais.fromJSON(api.infoPais());
  }

  //Practica 4

   List<Continente> getContinentesNuevo() {
        // Devuelve una lista de provincias, obtenidas a partir de la propiedad
    // provincies de RepositoryData.

    List<Continente> continentes = [];
    for (var conti in apiNueva.continentes) {
      continentes.add(Continente(nombre: conti["nombre"], imagen: conti["imagen"]));
    }

    return continentes;
  }

  // Implementar el método getPaises a partir del continente
  List<Pais> getPaisesNuevo(String nombreContinente){
    List<Pais> paises = [];

    // Recorremos la lista de provincies en RepositoryData para encontrar la que se busca
    for (var conti in apiNueva.continentes) {
      if (conti["nombre"] == nombreContinente) {
        // Cuando encontramos el continente, reocrremos los paises
        // y añadimos a la lista paises con los datos de cada pais

        for (var paisJSON in conti["paises"]) {
          paises.add(Pais.fromJSON(paisJSON));
        }
      }
    }

    return paises;
  }    

  // TO-DO:
  // Implementar el método infoPais
  Pais infoPaisNuevo() {
    return Pais(nombre: 'Sin implementar');
  }

}
