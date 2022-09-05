import 'package:all_persistences_types/floor/models/Book.dart';
import 'package:flutter/material.dart';

class AddBook extends StatelessWidget {
  AddBook({Key? key}) : super(key: key);

  final Text title = const Text("Novo Livro");

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  
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
                          hintText: "Nome do livro",
                          labelText: "Nome do livro"),
                      controller: _nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Insira o nome do livro";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Autor do livro",
                          labelText: "Autor do livro"),
                      controller: _authorController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Insira o autor do livro";
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Book book = Book(
                                  name: _nameController.text, 
                                  author: _authorController.text);
                              Navigator.pop(context, book);
                            }
                          },
                          child: const Text("Gravar")),
                    )
                  ]))),
    );
  }
}