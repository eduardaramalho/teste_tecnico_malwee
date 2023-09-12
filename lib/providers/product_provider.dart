import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:teste_tecnico/model/produto.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> products = [
    Product(
      id: 123, 
      nome: "Camisa Algodão 100% Cinza", 
      preco: 123, 
      material: "Algodão",
      url: "https://malwee.vtexassets.com/arquivos/ids/642858-1200-auto?v=638234727268470000&width=1200&height=auto&aspect=true"
    )
  ];

  List<Product> cart = [];

  void add(Product newProduct){
    products.add(newProduct);
    notifyListeners();
  }

  void deleteProduct(int id){
    int index = products.indexWhere((product) => product.id == id);
    products.removeAt(index);
    cart.removeAt(index);
    notifyListeners();
  }

  void editProduct(int id, Product newProduct){
    int index = products.indexWhere((product) => product.id == id);
    products[index].nome = newProduct.nome;
    products[index].preco = newProduct.preco;
    products[index].material = newProduct.material;
    products[index].url = newProduct.url;
    notifyListeners();
  }

  void addToCart(Product newProduct){
    cart.add(newProduct);
    notifyListeners();
  }

  void deleteFromCart(int id){
    int index = cart.indexWhere((product) => product.id == id);
    cart.removeAt(index);
    notifyListeners();
  }

  double get cartTotalPrice {
    double totalValue = 0;
    for(int i = 0; i < cart.length; i++){
      totalValue += cart[i].preco;
    }
    return totalValue;
  }
}