// ignore_for_file: unused_local_variable, unused_import, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:gsp_autos/pages/HomePage.dart';
import 'package:gsp_autos/pages/ListStorePage.dart';
import 'package:gsp_autos/pages/LoginPage.dart';
import 'package:gsp_autos/pages/RegisterPage.dart';
import 'package:gsp_autos/repositories/store_list_provider.dart';
import 'package:gsp_autos/storages/Loginbd.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final databasesPath = await getDatabasesPath();
  final dbPath = join(databasesPath, 'register.db');
  final database = await openDatabase(
    dbPath,
    onCreate: (db, version) {
      db.execute(TableStore.createTable);
    },
    version: 2,
  );

  final userDatabase = StoreController();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<PasswordVisibilityProvider>(
          create: (context) => PasswordVisibilityProvider(),
        ),
        ChangeNotifierProvider<PasswordVisibilityProviderRegister>(
          create: (context) => PasswordVisibilityProviderRegister(),
        ),
        // // ChangeNotifierProvider<ChangeNotifierProviderNavigation>(
        // //   create: (context) => ChangeNotifierProviderNavigation(),
        // ),
        Provider<StoreController>(
          create: (context) => StoreController(),
        ),
        ChangeNotifierProvider(
          create: (_) => StoreListProvider(StoreController()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/login",
      routes: {
        "/login_page": (context) => const LoginPage(),
        "/register": (context) => RegisterScreen(),
        "/home": (context) => const HomePage(),
        "/storeList": (context) => StoreList(),
      },
    );
  }
}