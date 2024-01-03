import 'package:flutter/material.dart';
import 'package:go_fltr/control/control_list.dart';
import 'package:go_fltr/control/fetch.dart';
import 'package:go_fltr/custom/Container/primary_header_container.dart';
import 'package:go_fltr/note/mahasiswa.dart';
import 'package:go_fltr/pages/AddPage.dart';
import 'package:go_fltr/pages/editForm.dart';
import 'package:go_fltr/utils/search_button.dart';

void main() {
  runApp(const MaterialApp());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  var loading = false;
  List<Mahasiswa> _listMahasiswa = [];
  String _searchKeyword = '';

  Future<Null> _fetchDataMahasiswa({String keyword = ''}) async {
    setState(() {
      loading = true;
    });

    try {
      List<Mahasiswa> fetchedData =
          await MahasiswaService.fetchDataMahasiswa(keyword: keyword);
      setState(() {
        _listMahasiswa = fetchedData;
        loading = false;
      });
    } catch (e) {
      // Tangani kesalahan jika ada
      print('Error fetching data: $e');
      setState(() {
        loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchDataMahasiswa();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              // ignore: unnecessary_const
              child: Column(
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  Search_Button(
                      text: _searchKeyword,
                      onTextChanged: (String value) {
                        setState(() {
                          _searchKeyword = value;
                          if (value.isEmpty) {
                            _fetchDataMahasiswa(); // call without keyword if text is empty
                          } else {
                            _fetchDataMahasiswa(keyword: value);
                          }
                        });
                      }),
                ],
              ),
            ),
            loading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: _listMahasiswa.length,
                    itemBuilder: (BuildContext context, i) {
                      final getdata = _listMahasiswa[i];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => EditForm(
                              id: getdata.id,
                              npm: getdata.npm,
                              username: getdata.username,
                              kelas: getdata.kelas,
                            ),
                          ));
                        },
                        child: ItemList(
                          npm: getdata.npm,
                          username: getdata.username,
                          kelas: getdata.kelas,
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const AddPage();
          }));
          _fetchDataMahasiswa();
        },
        backgroundColor: const Color(0xFF4C53A5),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
