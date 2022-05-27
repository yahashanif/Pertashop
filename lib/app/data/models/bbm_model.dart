class Bbm {
  String? idJenis;
  String? namaBbm;
  String? stok;
  String? hargaJual;

  Bbm({this.idJenis, this.namaBbm, this.stok, this.hargaJual});

  Bbm.fromJson(Map<String, dynamic> json) {
    idJenis = json['id_jenis'];
    namaBbm = json['nama_bbm'];
    stok = json['stok'];
    hargaJual = json['harga_jual'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id_jenis'] = idJenis;
    data['nama_bbm'] = namaBbm;
    data['stok'] = stok;
    data['harga_jual'] = hargaJual;
    return data;
  }
}
