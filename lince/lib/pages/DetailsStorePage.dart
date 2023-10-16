// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, file_names

import 'package:flutter/material.dart';
import 'package:gsp_autos/Entities/store.dart';
import 'package:gsp_autos/repositories/store_list_provider.dart';
import 'package:provider/provider.dart';

class StoreDetailsScreen extends StatelessWidget {
  final Store store;

  const StoreDetailsScreen({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(133, 36, 36, 1),
                   
                    ),
                  ),
                
                const Positioned(
                  top: 50,
                  left: 160,
                  child: Center(
                    child: Icon(
                      Icons.car_rental,
                      size: 100.0,
                      color: Color.fromARGB(133, 36, 36, 1),
                    ),
                  ),
                ),
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 350,
                    child: TextFormField(
                      initialValue: store.nameStore,
                      decoration:const InputDecoration(
                        labelText: 'Nome Loja',
                        fillColor: Color.fromARGB(133, 255, 255, 0),
                        labelStyle: TextStyle(
                          color: Color.fromRGBO(133, 36, 36, 1),
                        ),
                      ),
                      onChanged: (value) {
                        store.nameStore = value;
                      },
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Container(
                    width: 350,
                    child: TextFormField(
                      initialValue: store.CNPJ,
                      decoration: InputDecoration(
                        labelText: 'CNPJ',
                        fillColor: Color.fromARGB(133, 255, 255, 0),
                        labelStyle: TextStyle(
                          color: Color.fromRGBO(133, 36, 36, 1),
                        ),
                      ),
                      onChanged: (value) {
                        store.CNPJ = value;
                      },
                    ),
                  ),
                  SizedBox(height: 50.0),
                  Center(
                    child: ElevatedButton(

                      onPressed: () {
                        Provider.of<StoreListProvider>(context, listen: false)
                            .updateStore(store);

                        Navigator.of(context).pop();
                      },
                      style: ButtonStyle(
                        backgroundColor:MaterialStateProperty.all<Color>(
                            Color.fromRGBO(133, 36, 36, 1),
                        ),
                          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.symmetric(vertical: 12.0, horizontal: 29.0),
                        ),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            
                          ),
                        ),
                      ),
                      child: Text('Salvo'),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}