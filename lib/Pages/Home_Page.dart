import 'package:flutter/material.dart';
import '../Models/Model_Gifs.dart';
import '../Widgets/pagePoke.dart';
import 'package:card_swiper/card_swiper.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<ModelGifs>> _listadoGifs;
  late PageController _scrollController;
  int offset = 0;

  void initState() {
    super.initState();
    _scrollController = PageController();
    _scrollController.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: PageView(
              controller:
                  PageController(viewportFraction: 1 / 3, initialPage: 1),
              scrollDirection: Axis.horizontal,
              children: const <Widget>[
                GeneradorPoke(
                    texto: 'Hola',
                    img:
                        'https://media.discordapp.net/attachments/404777964706725892/1025139447517421648/Far_Cry_5_2021.06.02_-_11.07.02.05_2.png?width=468&height=468'),
                GeneradorPoke(
                    texto: 'Hola1',
                    img:
                        'https://media.discordapp.net/attachments/404777964706725892/1025139447865540618/Far_Cry_5_2021.06.02_-_11.36.34.08_2.png?width=468&height=468'),
                GeneradorPoke(
                    texto: 'Hola2',
                    img:
                        'https://media.discordapp.net/attachments/404777964706725892/1025139448293380126/Far_Cry_5_2021.06.02_-_18.07.58.02_2.png?width=468&height=468'),
              ],
            ),
          ),
          Expanded(
              flex: 2,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.network(
                    "https://media.discordapp.net/attachments/404777964706725892/1025141472615485440/Far_Cry_5_2021.06.05_-_04.55.10.00_2.png?width=312&height=468",
                    fit: BoxFit.fill,
                  );
                },
                itemCount: 10,
                itemWidth: 400.0,
                layout: SwiperLayout.STACK,
              ))
        ],
      ),
    );
  }
}
