// import 'package:flutter/material.dart';
// import 'package:go_fltr/custom/Container/primary_header_container.dart';
// import 'package:go_fltr/utils/search_button.dart';

// class CobsCreen extends StatelessWidget {
//   const CobsCreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             TPrimaryHeaderContainer(
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: 10.0,
//                   ),
//                   Search_Button(
//                     text: '',
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// Widget build(BuildContext context) {
//     return Scaffold(
    
//       body: Container(
//           child: loading
              // ? const Center(child: CircularProgressIndicator())
//               : ListView.builder(
//                   itemCount: _listMahasiswa.length,
//                   itemBuilder: (BuildContext context, i) {
//                     final getdata = _listMahasiswa[i];
//                     return GestureDetector(
//                       onTap: () {
//                         Navigator.of(context).push(MaterialPageRoute(
//                             builder: (BuildContext context) => EditForm(
//                                   id: getdata.id,
//                                   npm: getdata.npm,
//                                   username: getdata.username,
//                                   kelas: getdata.kelas,
//                                 )));
//                       },
//                       child: Container(
//                         child: ItemList(
//                           npm: getdata.npm,
//                           username: getdata.username,
//                           kelas: getdata.kelas,
//                         ),
//                       ),
//                     );
//                   })),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           await Navigator.push(context, MaterialPageRoute(builder: (context) {
//             return const AddPage();
//           }));
//           _fetchDataMahasiswa();
//         },
//         backgroundColor: const Color(0xFF4C53A5),
//         child: const Icon(
//           Icons.add,
//           color: Colors.white,
//         ),
//       ),
//     );
//   }
// }