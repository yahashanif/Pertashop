class Penjualan {
  String? namaBbm;
  String? idPenjualan;
  String? tanggal;
  String? sonding;
  String? speedAwal;
  String? speedAkhir;
  String? penjualan;
  String? totalPenjualan;

  Penjualan(
      {this.namaBbm,
      this.idPenjualan,
      this.tanggal,
      this.sonding,
      this.speedAwal,
      this.speedAkhir,
      this.penjualan,
      this.totalPenjualan});

  Penjualan.fromJson(Map<String, dynamic> json) {
    namaBbm = json['nama_bbm'];
    idPenjualan = json['id_penjualan'];
    tanggal = json['tanggal'];
    sonding = json['sonding'];
    speedAwal = json['speed_awal'];
    speedAkhir = json['speed_akhir'];
    penjualan = json['penjualan'];
    totalPenjualan = json['total_penjualan'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['nama_bbm'] = namaBbm;
    data['id_penjualan'] = idPenjualan;
    data['tanggal'] = tanggal;
    data['sonding'] = sonding;
    data['speed_awal'] = speedAwal;
    data['speed_akhir'] = speedAkhir;
    data['penjualan'] = penjualan;
    data['total_penjualan'] = totalPenjualan;
    return data;
  }
}
