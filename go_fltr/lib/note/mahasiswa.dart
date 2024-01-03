class Mahasiswa {
  int id;
  String npm;
  String username;
  String kelas;

  Mahasiswa(
      {required this.id,
      required this.npm,
      required this.username,
      required this.kelas});

  factory Mahasiswa.fromJson(Map<String, dynamic> json) => Mahasiswa(
      id: json["id"],
      npm: json["npm"],
      username: json["username"],
      kelas: json["kelas"]);
  Map<String, dynamic> toJson() => {
        "id": id,
        "npm": npm,
        "username": username,
        "kelas": kelas,
      };
}
