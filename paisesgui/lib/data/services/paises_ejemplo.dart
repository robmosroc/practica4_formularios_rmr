/*
Esta clase nos proporciona información estática de ejemplo sobre los contientes y los países.
*/


class PaisesEjemplo{

  List<dynamic> getContinentes(){
    var continentes=[{"nombre":"Europa","imagen":"https://ipjvxgxqzivhreoxkwcs.supabase.co/storage/v1/object/public/imagenes/continentes/europa.jpg"},
                     {"nombre":"Asia","imagen":"https://ipjvxgxqzivhreoxkwcs.supabase.co/storage/v1/object/public/imagenes/continentes/asia.jpg"},
                     {"nombre":"África","imagen":"https://ipjvxgxqzivhreoxkwcs.supabase.co/storage/v1/object/public/imagenes/continentes/africa.jpg"},
                     {"nombre":"América","imagen":"https://ipjvxgxqzivhreoxkwcs.supabase.co/storage/v1/object/public/imagenes/continentes/america.jpg"},
                     {"nombre":"Oceanía","imagen":"https://ipjvxgxqzivhreoxkwcs.supabase.co/storage/v1/object/public/imagenes/continentes/oceania.jpg"}];

    return continentes;
  }    

  List<dynamic> getPaises(){
    var paises=[{"nombre":"Francia","imagen":"https://ipjvxgxqzivhreoxkwcs.supabase.co/storage/v1/object/public/imagenes/paises/francia.jpg"},
                {"nombre":"España","imagen":"https://ipjvxgxqzivhreoxkwcs.supabase.co/storage/v1/object/public/imagenes/paises/espanya.jpg"},
                {"nombre":"Italia","imagen":"https://ipjvxgxqzivhreoxkwcs.supabase.co/storage/v1/object/public/imagenes/paises/italia.jpg"},
                {"nombre":"Alemania","imagen":"https://ipjvxgxqzivhreoxkwcs.supabase.co/storage/v1/object/public/imagenes/paises/alemania.jpg"},
                {"nombre":"Portugal","imagen":"https://ipjvxgxqzivhreoxkwcs.supabase.co/storage/v1/object/public/imagenes/paises/portugal.jpg"}];

    return paises;
  }    

  dynamic infoPais(){
    var pais={"id":2,"nombre":"Francia","capital":"París","poblacion":"68000000","imagen":"https://ipjvxgxqzivhreoxkwcs.supabase.co/storage/v1/object/public/imagenes/paises/francia.jpg","descripcion":"La República Francesa pertenece a la Unión Europea desde 1958 recogiendo así una larga tradición como país de gran importancia diplomática. De norte a sur, presenta lugares que la convierten en uno de los destinos principales de Europa a la hora de viajar. Más allá de la mítica París, capital bautizada con seudónimos tan magníficos como la ciudad del amor o la ciudad de las luces, con lugares tan románticos e idílicos como Montmartre o la Torre Eiffel, existen otros rincones con sus propios encantos. \n\nLyon, ciudad donde nació el cine, los castillos de Carcassonne, o la región de Normandía son algunos de ellos. Una de las más increíbles rutas es la de la Costa Azul, en el Mediterráneo, donde las caletas se erigen en fiordos, a su manera, acantilados vertiginosos y olor a salitre. En este recorrido se encuentra el Parque Nacional de Les Calanques, una especie de Riviera francesa, que sigue hasta el pequeño pueblo pesquero de Cassis y el archipiélago de Hyères hasta llegar a Cannes y seguir más allá hasta Cap Ferrat, en un camino lleno de vertiginosas carreteras, interesantes ciudades como Niza y mucho arte esparcido por sus pueblos. \n\nY es que los paisajes de Francia dan para mucho. El país más extenso de la Europa occidental tiene gran cantidad de maravillas para ofrecer.","latitud":48.8566,"longitud":2.3522,"continente_id":1};
    
    return pais;
  } 

}