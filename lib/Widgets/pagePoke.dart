import 'Package:flutter/material.dart';
import 'package:poke_api/Models/Model_Gifs.dart';

Widget cartaPoke(String texto, String img, List types) {
  final tipo1 = types[0]["type"]["name"];
  var tipo2 = "normal";
  try {
    tipo2 = types[1]["type"]["name"];
  } catch (e) {
    tipo2 = tipo1;
  }

  return Container(
    constraints: const BoxConstraints.expand(),
    margin: const EdgeInsets.only(left: 10, bottom: 10),
    child: Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(10)),
      elevation: 10,
      child: Column(
        children: [
          Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  image: DecorationImage(
                    image: Image.network(
                      img,
                      loadingBuilder: (context, child, loadingProgress) =>
                          loadingProgress == null
                              ? child
                              : const Center(
                                  child: CircularProgressIndicator()),
                    ).image,
                    fit: BoxFit.contain,
                  ),
                ),
              )),
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                Row(children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                        decoration:
                            BoxDecoration(color: SeleccionarColor(tipo1),borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10)))),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                        decoration:
                            BoxDecoration(color: SeleccionarColor(tipo2),borderRadius: const BorderRadius.only(bottomRight: Radius.circular(10)))),
                  )
                ]),
                Center(
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, bottom: 3),
                      child: Text(
                        texto[0].toUpperCase() + texto.substring(1),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold),
                      )),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}

List<Widget> ListGifs(List<ModelPokes> listado) {
  final List<Widget> gifs = [];
  for (var element in listado) {
    gifs.add(
      GestureDetector(
        child: cartaPoke(element.name, element.img, element.types),
        onTap: () {
          print(element.name);
        },
      ),
    );
  }

  return gifs;
}

SeleccionarColor(String tipo) {
  switch (tipo) {
    case "normal":
      return Colors.brown;
    case "fighting":
      return Colors.red;
    case "flying":
      return const Color.fromRGBO(130, 161, 215, 1);
    case "poison":
      return Colors.purple;
    case "ground":
      return Colors.brown[300];
    case "rock":
      return Colors.brown[700];
    case "bug":
      return Colors.green;
    case "ghost":
      return Colors.indigo;
    case "steel":
      return Colors.blueGrey;
    case "fire":
      return Colors.orange;
    case "water":
      return Colors.blue;
    case "grass":
      return Colors.green[300];
    case "electric":
      return Colors.yellow;
    case "psychic":
      return Colors.pink;
    case "ice":
      return Colors.lightBlue;
    case "dragon":
      return Colors.deepPurple;
    case "dark":
      return Colors.brown[900];
    case "fairy":
      return Colors.pink[300];
    case "unknown":
      return Colors.grey;
    case "shadow":
      return Colors.black;
    default:
      return Colors.white;
  }
}
