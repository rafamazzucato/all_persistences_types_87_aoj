import 'package:all_persistences_types/sqlite/models/person.dart';
import 'package:flutter/material.dart';

class AddPerson extends StatelessWidget {
  AddPerson({Key? key}) : super(key: key);

  final Text title = const Text("Nova Pessoa");

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

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
                          hintText: "Nome da pessoa",
                          labelText: "Nome da pessoa"),
                      controller: _nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Insira o nome da pessoa";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Sobrenome da pessoa",
                          labelText: "Sobrenome da pessoa"),
                      controller: _lastNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Insira o sobrenome da pessoa";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Endereço da pessoa",
                          labelText: "Endereço da pessoa"),
                      controller: _addressController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Insira o endereço da pessoa";
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Person person = Person(
                                  firstName: _nameController.text, 
                                  lastName: _lastNameController.text, 
                                  address: _addressController.text);
                              Navigator.pop(context, person);
                            }
                          },
                          child: const Text("Gravar")),
                    )
                  ]))),
    );
  }
}
