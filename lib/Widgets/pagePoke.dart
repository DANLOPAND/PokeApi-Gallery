import 'Package:flutter/material.dart';

class GeneradorPoke extends StatelessWidget {
  const GeneradorPoke({Key? key, required this.texto, required this.img})
      : super(key: key);
  final String texto;
  final String img;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: cartaPoke(texto, img),
    );
  }
}

Widget cartaPoke(String texto, String img) {
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
                      topLeft:  Radius.circular(10),
                      topRight:  Radius.circular(10)),
                  image: DecorationImage(
                    image: NetworkImage(img),
                    fit: BoxFit.cover,
                  ),
                ),
              )),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(texto),
            ),
          )
        ],
      ),
    ),
  );
}
