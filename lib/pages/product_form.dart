import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_tecnico/providers/product_provider.dart';

import '../model/produto.dart';

class ProductForm extends StatefulWidget {
  const ProductForm({super.key,});

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void _submit (){
    if(!_formKey.currentState!.validate()) return;

    _formKey.currentState!.save();
    final newProduct = Product(
      id: Random().nextInt(1000),
      nome:  _formData["nome"].toString(),
      preco: double.parse(_formData["preco"]!),
      material: _formData["material"].toString(),
      url: _formData["url"].toString(),
    );

    Provider.of<ProductProvider>(context, listen: false).add(newProduct);

    Navigator.of(context).pop();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         iconTheme: const IconThemeData(
            color: Colors.white, //change your color here
         ),
        backgroundColor: Colors.black,
        title: const Text('Adicionar Produto', 
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: _submit,
            icon: const Icon(Icons.done, 
              color: Colors.white,
            )
          ) 
        ],
      ),
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Nome do produto'
                    ),
                    validator: (value) => value == "" 
                    ? "Insira o nome do produto." : null,
                    onSaved:  (newValue) => _formData["nome"] = newValue!,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Preço',
                    ),
                    onSaved:  (newValue) => _formData["preco"] = newValue!,
                    validator: (value) => value == "" 
                    ? "Insira o valor do produto." : null,
                  ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Material'
                  ),
                  onSaved:  (newValue) => _formData["material"] = newValue!,
                  validator: (value) => value == "" 
                    ? "Insira o material do produto." : null,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Url da imagem'
                  ),
                  onSaved:  (newValue) => _formData["url"] = newValue!,
                  validator: (value) => value == "" 
                    ? "Insira a url da imagem." : null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}