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
        noRek: "1234567890",
        logoAsset: "assets/bank/Bank_Aceh_Syariah.png",
        onEdit: () {},
        onDelete: () {},
      ),
      CardCredits(
        namaRek: "MANDIRI",
        noRek: "9876543210",
        logoAsset: "assets/bank/Bank_Mandiri.png",
        onEdit: () {},
        onDelete: () {},
      ),
      CardCredits(
        namaRek: "BNI",
        noRek: "1122334455",
        logoAsset: "assets/bank/Bank_Negara_Indonesia.png",
        onEdit: () {},
        onDelete: () {},
      ),
    ];

    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: SizedBox(
        height: 280,
        child: PageView.builder(
          controller: _pageController,
          itemCount: cardList.length,
          itemBuilder: (context, index) {
            return AnimatedBuilder(
              animation: _pageController,
              builder: (context, child) {
                double value = 1.0;
                if (_pageController.position.haveDimensions) {
                  value = ((_pageController.page ?? _pageController.initialPage).toDouble()) - index.toDouble();
                  value = (1 - (value.abs() * 0.18)).clamp(0.82, 1.0);
                }
                return Transform.scale(
                  scale: value,
                  child: Opacity(
                    opacity: value,
                    child: Transform.translate(
                      offset: Offset(0, (1 - value) * 32),
                      child: cardList[index],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}