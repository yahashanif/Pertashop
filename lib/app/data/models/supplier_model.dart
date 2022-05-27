class Supplier {
  String? idSupplier;
  String? tanggal;
  String? supir;
  String? nomorPolisi;
  String? idSupir;
  String? nama;
  String? telp;

  Supplier(
      {this.idSupplier,
      this.tanggal,
      this.supir,
      this.nomorPolisi,
      this.idSupir,
      this.nama,
      this.telp});

  Supplier.fromJson(Map<String, dynamic> json) {
    idSupplier = json['id_supplier'];
    tanggal = json['tanggal'];
    supir = json['supir'];
    nomorPolisi = json['nomor_polisi'];
    idSupir = json['id_supir'];
    nama = json['nama'];
    telp = json['telp'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id_supplier'] = idSupplier;
    data['tanggal'] = tanggal;
    data['supir'] = supir;
    data['nomor_polisi'] = nomorPolisi;
    data['id_supir'] = idSupir;
    data['nama'] = nama;
    data['telp'] = telp;
    return data;
  }
}
