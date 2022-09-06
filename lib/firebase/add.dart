
import 'package:all_persistences_types/firebase/models/Car.dart';
import 'package:flutter/material.dart';

class AddCar extends StatelessWidget {
  AddCar({Key? key}) : super(key: key);

  final Text title = const Text("Novo Carro");

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: title),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Nome do carro",
                          labelText: "Nome do carro"),
                      controller: _nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Insira o nome do carro";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Marca do carro",
                          labelText: "Marca do carro"),
                      controller: _brandController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Insira a marca do carro";
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Car car = Car(
                                  name: _nameController.text, 
                                  brand: _brandController.text);
                              Navigator.pop(context, car);
                            }
                          },
                          child: const Text("Gravar")),
                    )
                  ]))),
    );
  }
}