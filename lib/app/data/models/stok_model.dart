class Stok {
  String? idPembelian;
  String? tanggal;
  String? jumlahPemesanan;
  String? harga;
  String? namaBbm;
  String? nama;

  Stok(
      {this.idPembelian,
      this.tanggal,
      this.jumlahPemesanan,
      this.harga,
      this.namaBbm,
      this.nama});

  Stok.fromJson(Map<String, dynamic> json) {
    idPembelian = json['id_pembelian'];
    tanggal = json['tanggal'];
    jumlahPemesanan = json['jumlah_pemesanan'];
    harga = json['harga'];
    namaBbm = json['nama_bbm'];
    nama = json['nama'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id_pembelian'] = idPembelian;
    data['tanggal'] = tanggal;
    data['jumlah_pemesanan'] = jumlahPemesanan;
    data['harga'] = harga;
    data['nama_bbm'] = namaBbm;
    data['nama'] = nama;
    return data;
  }
}
