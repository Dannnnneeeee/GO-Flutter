// import 'package:flutter/material.dart';
// import 'package:go_fltr/control/control_list.dart';
// import 'package:go_fltr/note/mahasiswa.dart';
// import 'package:go_fltr/pages/editForm.dart';

// Widget buildMahasiswaList(List<Mahasiswa> mahasiswaList, bool loading) {
//   if (loading) {
//     return const Center(child: CircularProgressIndicator());
//   } else {
//     return ListView.builder(
//       shrinkWrap: true,
//       itemCount: mahasiswaList.length,
//       itemBuilder: (BuildContext context, i) {
//         final getdata = mahasiswaList[i];
//         return GestureDetector(
//           onTap: () {
//             Navigator.of(context).push(MaterialPageRoute(
//               builder: (BuildContext context) => EditForm(
//                 id: getdata.id,
//                 npm: getdata.npm,
//                 username: getdata.username,
//                 kelas: getdata.kelas,
//               ),
//             ));
//           },
//           child: ItemList(
//             npm: getdata.npm,
//             username: getdata.username,
//             kelas: getdata.kelas,
//           ),
//         );
//       },
//     );
//   }
// }


//editformAwal
 // @override
  // void initState() {
  //   super.initState();
  //   npmController.text = widget.npm;
  //   userController.text = widget.username;
  //   kelasController.text = widget.kelas;
  // }

  // Future<void> editData(
  //     String npm, String username, String kelas, int id) async {
  //   var url = "http://10.0.2.2:2168/mahasiswa";
  //   var body = {
  //     'npm': npmController.text,
  //     'username': userController.text,
  //     'kelas': kelasController.text,
  //     'id': widget.id.toString()
  //   };

  //   await http.put(
  //     Uri.parse(url),
  //     body: body,
  //   );
  // }

  // Future<void> hapusData(String id) async {
  //   var url = "http://10.0.2.2:2168/mahasiswa/$id"; // Ubah URL sesuai kebutuhan

  //   var response = await http.delete(
  //     Uri.parse(url),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=utf-8'
  //     },
  //   );

  //   if (response.statusCode == 200) {
  //     // Jika penghapusan berhasil, tampilkan pesan sukses atau lakukan tindakan lainnya
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: const Text('Data berhasil dihapus'),
  //         backgroundColor: Theme.of(context).colorScheme.primary,
  //       ),
  //     );
  //   } else {
  //     // Jika penghapusan gagal, tampilkan pesan error atau lakukan penanganan lainnya
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         content: Text('Gagal menghapus data'),
  //         backgroundColor: Colors.red,
  //       ),
  //     );
  //   }
  // }


//homepage sebelum dibuat search
// void main() {
//   runApp(const MaterialApp());
// }

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//   @override
//   // ignore: library_private_types_in_public_api
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<HomePage> {
//   var loading = false;
//   List<Mahasiswa> _listMahasiswa = [];

//   Future<Null> _fetchDataMahasiswa() async {
//     setState(() {
//       loading = true;
//     });

//     try {
//       List<Mahasiswa> fetchedData = await MahasiswaService.fetchDataMahasiswa();
//       setState(() {
//         _listMahasiswa = fetchedData;
//         loading = false;
//       });
//     } catch (e) {
//       // Tangani kesalahan jika ada
//       print('Error fetching data: $e');
//       setState(() {
//         loading = false;
//       });
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _fetchDataMahasiswa();
//   }



//searchbtn awal
//class Search_Button extends StatelessWidget {
//   const Search_Button({
//     super.key,
//     required this.text,
//     this.iconData,
//   });
//   final String text;
//   final IconData? iconData;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 20.0),
//       child: Container(
//         width: TDeviceUtils.getScreenWidth(context),
//         padding: const EdgeInsets.all(16.0),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(16.0),
//           border: Border.all(color: Colors.grey),
//         ),
//         child: const Row(
//           children: [
//             Icon(Icons.search),
//             SizedBox(width: 0),
//             Expanded(
//                 child: TextField(
//               decoration: InputDecoration(
//                 hintText: 'Search in here',
//                 border: InputBorder.none,
//               ),
//             )),
//           ],
//         ),
//       ),
//     );
//   }
// }



//fetch awal
// class MahasiswaService {
//   static Future<List<Mahasiswa>> fetchDataMahasiswa() async {
//     List<Mahasiswa> listMahasiswa = [];

//     Uri url = Uri.parse("http://10.0.2.2:2168/mahasiswa");

//     final response = await http.get(url);

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);

//       for (Map<String, dynamic> i in data['data']) {
//         final newMahasiswa = Mahasiswa.fromJson(i);
//         if (!listMahasiswa
//             .any((mahasiswa) => mahasiswa.id == newMahasiswa.id)) {
//           listMahasiswa.add(newMahasiswa);
//         }
//       }
//     }

//     return listMahasiswa;
//   }
// }
