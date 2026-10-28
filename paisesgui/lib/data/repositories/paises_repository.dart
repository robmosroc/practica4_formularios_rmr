// Define el repositorio de acceso a los datos
// Esta capa es la que se usa desde la aplicación para abstraer
// el acceso a los datos.
// Hemos cambiado el repositorio. 
// Ahora en vez de obtenerlo de la clase PaisesApi lo obtenemos de PaisesEjemplo


import 'package:paisesgui/data/services/paises_ejemplo.dart';
import 'package:paisesgui/domain/entities/continente.dart';
import 'package:paisesgui/domain/entities/pais.dart';

class PaisesRepository {
  // Con late indicamos que este valor 
  // se inicializar posteriormente (en el constructor)
  late PaisesEjemplo api;

  PaisesRepository() {
    api = PaisesEjemplo();
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

}
