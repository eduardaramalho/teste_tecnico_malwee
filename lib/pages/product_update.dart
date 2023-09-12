import 'package:flutter/material.dart';

class ProductUpdate extends StatefulWidget {
  const ProductUpdate({super.key, required this.function});

  final void Function(String nome, String preco, String material, String url) function;

  @override
  State<ProductUpdate> createState() => _ProductUpdateState();
}

class _ProductUpdateState extends State<ProductUpdate> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void _submit (){
     if(!_formKey.currentState!.validate()) return;

    _formKey.currentState!.save();

    widget.function(
      _formData["nome"].toString(),
      _formData["preco"].toString(),
      _formData["material"].toString(),
      _formData["url"].toString(),
    );

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
        title: const Text('Editar Produto', 
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
                    initialValue: _formData['nome']?.toString(),
                    decoration: const InputDecoration(
                      labelText: 'Nome do produto'
                    ),
                    validator: (value) => value == "" 
                    ? "Insira o nome do produto." : null,
                    onSaved:  (newValue) => _formData["nome"] = newValue!,
                  ),
                  TextFormField(
                    initialValue: _formData['preco']?.toString(),
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Preço',
                    ),
                    onSaved:  (newValue) => _formData["preco"] = newValue!,
                    validator: (value) => value == "" 
                    ? "Insira o valor do produto." : null,
                  ),
                TextFormField(
                  initialValue: _formData['material']?.toString(),
                  decoration: const InputDecoration(
                    labelText: 'Material'
                  ),
                  onSaved:  (newValue) => _formData["material"] = newValue!,
                  validator: (value) => value == "" 
                    ? "Insira o material do produto." : null,
                ),
                TextFormField(
                  initialValue: _formData['url']?.toString(),
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