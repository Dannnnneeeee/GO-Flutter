import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final _formKey = GlobalKey<FormState>();
  final npmController = TextEditingController();
  final userController = TextEditingController();
  final kelasController = TextEditingController();

  Future<void> addData(String npm, String username, String kelas) async {
    var url = "http://10.0.2.2:2168/mahasiswa";
    var body = {
      'npm': npmController.text,
      'username': userController.text,
      'kelas': kelasController.text
    };

    await http.post(
      Uri.parse(url),
      body: body,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Insert Data',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF4C53A5),
      ),
      // body: Container(
      //     padding: EdgeInsets.all(10),
      //     child: Column(
      //       children: <Widget>[
      //         Text("NPM"),
      //         Padding(padding: EdgeInsets.all(5)),
      //         TextFormField(
      //           decoration: InputDecoration(
      //             labelText: "NPM",
      //             border: OutlineInputBorder(
      //                 borderRadius: BorderRadius.circular(5.0)),
      //           ),
      //         ),
      //       ],
      //     ))
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
                  addData(
                    npmController.text,
                    userController.text,
                    kelasController.text,
                  );
                  npmController.clear();
                  userController.clear();
                  kelasController.clear();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Data berhasil ditambahkan'),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                  );
                  Navigator.pop(context, true);
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
