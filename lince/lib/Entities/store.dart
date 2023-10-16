// ignore_for_file: non_constant_identifier_names, file_names

class Store{
  final int? id;
  String CNPJ;
  String nameStore;
 final String? password;
 String? autonomy;

 Store({
    this.id,
    required this.CNPJ,
    required this.nameStore,
    this.password,
    this.autonomy,
  });

}
