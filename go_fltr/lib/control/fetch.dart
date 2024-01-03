import 'package:go_fltr/note/mahasiswa.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MahasiswaService {
  static Future<List<Mahasiswa>> fetchDataMahasiswa(
      {String keyword = ''}) async {
    List<Mahasiswa> listMahasiswa = [];

    Uri url = Uri.parse("http://10.0.2.2:2168/mahasiswa");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      for (Map<String, dynamic> i in data['data']) {
        final newMahasiswa = Mahasiswa.fromJson(i);
        final lowercaseKeyword =
            keyword.toLowerCase(); // Convert keyword to lowercase

        // Convert data to lowercase before comparison
        if (newMahasiswa.username.toLowerCase().contains(lowercaseKeyword) ||
            newMahasiswa.npm.toLowerCase().contains(lowercaseKeyword) ||
            newMahasiswa.kelas.toLowerCase().contains(lowercaseKeyword)) {
          listMahasiswa.add(newMahasiswa);
        }
      }
    }

    return listMahasiswa;
  }
}
