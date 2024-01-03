import 'package:http/http.dart' as http;

class DataControl {
  Future<void> editData(
      String npm, String username, String kelas, int id) async {
    var url = "http://10.0.2.2:2168/mahasiswa";
    var body = {
      'npm': npm,
      'username': username,
      'kelas': kelas,
      'id': id.toString(),
    };

    await http.put(
      Uri.parse(url),
      body: body,
    );
  }

  Future<void> hapusData(String id) async {
    var url = "http://10.0.2.2:2168/mahasiswa/$id";

    var response = await http.delete(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8'
      },
    );

    if (response.statusCode == 200) {
      // Jika penghapusan berhasil, tampilkan pesan sukses atau lakukan tindakan lainnya
      print('Data berhasil dihapus');
    } else {
      // Jika penghapusan gagal, tampilkan pesan error atau lakukan penanganan lainnya
      print('Gagal menghapus data');
    }
  }
}
