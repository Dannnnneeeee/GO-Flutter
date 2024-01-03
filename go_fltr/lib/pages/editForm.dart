// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:go_fltr/control/control_editDel.dart';
import 'package:go_fltr/pages/home_page.dart';
// ignore: unused_import
import 'dart:convert';

class EditForm extends StatefulWidget {
  final int id;
  final String npm;
  final String username;
  final String kelas;

  const EditForm(
      {super.key,
      required this.id,
      required this.npm,
      required this.username,
      required this.kelas});

  @override
  State<EditForm> createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
  final _formKey = GlobalKey<FormState>();
  final npmController = TextEditingController();
  final userController = TextEditingController();
  final kelasController = TextEditingController();
  final dataControl = DataControl();

  @override
  void initState() {
    super.initState();
    npmController.text = widget.npm;
    userController.text = widget.username;
    kelasController.text = widget.kelas;
  }

  // @override
  // void dispose() {
  //   npmController.dispose();
  //   userController.dispose();
  //   kelasController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Insert Data',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF4C53A5),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Delete Note'),
                        content: const Text('Are you sure?'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Cancel')),
                          TextButton(
                              onPressed: () async {
                                await dataControl
                                    .hapusData(widget.id.toString());
                                // Navigator.pushReplacement(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => const HomePage()),
                                //       (route) => false,
                                // );
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomePage()),
                                  (route) =>
                                      false, // Menghapus semua halaman dari tumpukan
                                );
                              },
                              child: const Text('Delete')),
                        ],
                      );
                    });
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.white,
              )),
          const SizedBox(
            width: 16,
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: npmController,
              decoration: const InputDecoration(
                labelText: 'NPM',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'NPM wajib diisi';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: userController,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Username wajib diisi';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: kelasController,
              decoration: const InputDecoration(
                labelText: 'Kelas',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Kelas wajib diisi';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Panggil metode editData dari kontrol
                  dataControl.editData(
                    npmController.text,
                    userController.text,
                    kelasController.text,
                    widget.id,
                  );
                  npmController.clear();
                  userController.clear();
                  kelasController.clear();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Data berhasil Diupdate'),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                  );
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (BuildContext context) => const HomePage()),
                  );
                }
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xFF4C53A5)),
              ),
              child:
                  const Text('Simpan', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
