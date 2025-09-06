class CreditCardModel {
  final int? id;
  final String namaRek;
  final String noRek;
  final String logoAsset;

  CreditCardModel({
    this.id,
    required this.namaRek,
    required this.noRek,
    required this.logoAsset,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'nama_rek': namaRek,
    'no_rek': noRek,
    'logo_asset': logoAsset,
  };

  factory CreditCardModel.fromMap(Map<String, dynamic> map) => CreditCardModel(
    id: map['id'],
    namaRek: map['nama_rek'],
    noRek: map['no_rek'],
    logoAsset: map['logo_asset'],
  );
}
