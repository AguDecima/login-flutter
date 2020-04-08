

import 'dart:convert';

import 'package:formvalidation/src/models/producto_model.dart';
import 'package:http/http.dart' as http;

class ProductosProvider {

  final String _url = "https://flutter-producto-91398.firebaseio.com";

  Future<bool> creatProducto( ProductoModel producto) async {
    final url = '$_url/productos.json';
    final response = await http.post(url, body: productoModelToJson(producto));
    final decodedData = json.decode(response.body);
    print(decodedData);
    return true;
  }


}