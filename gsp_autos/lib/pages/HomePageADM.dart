import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

 Widget _selectedCleaning({
  required Color color,
  required String tittle,
  required String subtittle,
}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10.0),
    padding: EdgeInsets.only(
      left: 20,
    ),
    height: 120,
    width: 240,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(15.0),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          tittle,
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          subtittle,
          style: TextStyle(
            fontSize: 19,
            color: Colors.white70,
          ),
        ),
      ],
    ),
  );
}

Widget _selectedExtras({
  required String image,
  required String name,
}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all(color: Colors.grey, width: 2),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 80,
          decoration:
              BoxDecoration(image: DecorationImage(image: AssetImage(image))),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          name,
          style: TextStyle(fontSize: 20),
        )
      ],
    ),
  );
}

Widget _buildGridItem({
  required String image,
  required String name,
}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all(color: Colors.grey, width: 2),
    ),
    child: _selectedExtras(image: image, name: name),
  );
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Theme.of(context).colorScheme.secondary,
    appBar: AppBar(
      elevation: 0.0,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      title: Text(
        "Bem Vindo:)",
        style: TextStyle(
          fontSize: 23,
        ),
      ),
      centerTitle: true,
    ),
    body: Container(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 30, top: 30),
              child: Text(
                "Avisos:",
                style: TextStyle(
                  fontSize: 19,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 30,
                  top: 30,
                ),
                child: Row(
                  children: [
                    _selectedCleaning(
                      color: Theme.of(context).colorScheme.secondary,
                      subtittle: "Versão beta",
                      tittle: "Programa",
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Opções a seguir:",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20,
                    ),
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 8,
                      childAspectRatio: 1.30,
                      shrinkWrap: true, // Use this to allow the GridView to scroll inside the ListView
                      physics: NeverScrollableScrollPhysics(), // Disable GridView scrolling
                      children: [
                        _buildGridItem(
                          image: "assets/prancheta.png",
                          name: "Lojas Parceiras",
                        ),
                        _buildGridItem(
                          image: "assets/carrolista.png",
                          name: "Veículos",
                        ),
                        _buildGridItem(
                          image: "assets/engrenagem-removebg-preview.png",
                          name: "Configurações",
                        ),
                        _buildGridItem(
                          image: "assets/prancheta.png",
                          name: "Vendas",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}}