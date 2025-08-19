import 'package:flutter/material.dart';
import 'package:finance_tracker/widgets/cards/card_credits.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  final PageController _pageController = PageController(viewportFraction: 0.82);

  @override
  Widget build(BuildContext context) {
    final cardList = [
      CardCredits(
        namaRek: "APOK GACOR",
        noRek: "0987654321",
        logoAsset: "assets/bank/Bank_Syariah_Indonesia.png",
        onEdit: () {},
        onDelete: () {},
      ),
      CardCredits(
        namaRek: "APOK GACOR",
        noRek: "1234567890",
        logoAsset: "assets/bank/Bank_Tabungan_Negara_Syariah.png",
        onEdit: () {},
        onDelete: () {},
      ),
      CardCredits(
        namaRek: "APOK GACOR",
        noRek: "1122334455",
        logoAsset: "assets/bank/Bank_Mandiri.png",
        onEdit: () {},
        onDelete: () {},
      ),
      CardCredits(
        namaRek: "APOK GACOR",
        noRek: "1234567890",
        logoAsset: "assets/bank/Bank_Tabungan_Negara.png",
        onEdit: () {},
        onDelete: () {},
      ),
      CardCredits(
        namaRek: "APOK GACOR",
        noRek: "1122334455",
        logoAsset: "assets/bank/Bank_Negara_Indonesia.png",
        onEdit: () {},
        onDelete: () {},
      ),
      CardCredits(
        namaRek: "APOK GACOR",
        noRek: "1234567890",
        logoAsset: "assets/bank/Bank_Rakyat_Indonesia.png",
        onEdit: () {},
        onDelete: () {},
      ),
      CardCredits(
        namaRek: "APOK GACOR",
        noRek: "1234567890",
        logoAsset: "assets/bank/Bank_Aceh_Syariah.png",
        onEdit: () {},
        onDelete: () {},
      ),
    ];

    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: SizedBox(
        height: 300,
        child: PageView.builder(
          controller: _pageController,
          itemCount: cardList.length,
          onPageChanged: (index) {
            // Optional: bisa tambahkan logika jika ingin
          },
          itemBuilder: (context, index) {
            // Untuk efek looping
            final realIndex = index % cardList.length;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: cardList[realIndex],
            );
          },
        ),
      ),
    );
  }
}
