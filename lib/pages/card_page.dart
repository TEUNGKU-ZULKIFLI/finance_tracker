import 'package:flutter/material.dart';
import 'package:finance_tracker/widgets/cards/card_credits.dart';
import 'package:finance_tracker/models/credit_card_model.dart';
import 'package:finance_tracker/services/db_service.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  final PageController _pageController = PageController(viewportFraction: 0.82);

  List<CreditCardModel> cardModels = [];

  final List<String> bankLogos = [
    'Bank_Aceh_Syariah.png',
    'Bank_Mandiri.png',
    'Bank_Negara_Indonesia.png',
    'Bank_Rakyat_Indonesia.png',
    'Bank_Syariah_Indonesia.png',
    'Bank_Tabungan_Negara.png',
    'Bank_Tabungan_Negara_Syariah.png',
  ];

  @override
  void initState() {
    super.initState();
    _loadCards();
  }

  Future<void> _loadCards() async {
    cardModels = await DbService().getCreditCards();
    setState(() {});
  }

  void _showAddCardDialog() {
    String? namaRek;
    String? noRek;
    String? logoAsset;

    showDialog(
      context: context,
      builder: (context) {
        final colorScheme = Theme.of(context).colorScheme;
        final formKey = GlobalKey<FormState>();
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: colorScheme.surface,
          contentPadding: const EdgeInsets.all(0),
          titlePadding: const EdgeInsets.all(0),
          title: null,
          content: Padding(
            padding: const EdgeInsets.all(28),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Tambah Kartu Kredit',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: colorScheme.primary,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nama Rekening',
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.person),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: colorScheme.primary),
                      ),
                    ),
                    onSaved: (val) => namaRek = val,
                    validator: (val) =>
                        val == null || val.isEmpty ? 'Wajib diisi' : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nomor Rekening',
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.credit_card),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: colorScheme.primary),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onSaved: (val) => noRek = val,
                    validator: (val) =>
                        val == null || val.isEmpty ? 'Wajib diisi' : null,
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Brand Bank',
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.account_balance),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: colorScheme.primary),
                      ),
                    ),
                    items: bankLogos.map((logo) {
                      return DropdownMenuItem(
                        value: logo,
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/bank/$logo',
                              width: 32,
                              height: 32,
                            ),
                            const SizedBox(width: 12),
                            SizedBox(
                              width: 150,
                              child: Text(
                                logo
                                    .replaceAll('.png', '')
                                    .replaceAll('_', ' '),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                    onChanged: (val) => logoAsset = val,
                    validator: (val) => val == null ? 'Pilih bank' : null,
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: colorScheme.secondary,
                            side: BorderSide(color: colorScheme.secondary),
                          ),
                          child: const Text('BATAL'),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              final card = CreditCardModel(
                                namaRek: namaRek!,
                                noRek: noRek!,
                                logoAsset: logoAsset!,
                              );
                              await DbService().insertCreditCard(card);
                              Navigator.pop(context);
                              _loadCards();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: colorScheme.primary,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text('SIMPAN'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showEditCardDialog(CreditCardModel card) {
    String? namaRek = card.namaRek;
    String? noRek = card.noRek;
    String? logoAsset = card.logoAsset;

    showDialog(
      context: context,
      builder: (context) {
        final colorScheme = Theme.of(context).colorScheme;
        final formKey = GlobalKey<FormState>();
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: colorScheme.surface,
          contentPadding: const EdgeInsets.all(0),
          titlePadding: const EdgeInsets.all(0),
          title: null,
          content: Padding(
            padding: const EdgeInsets.all(28),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Edit Kartu Kredit',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: colorScheme.primary,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    initialValue: namaRek,
                    decoration: InputDecoration(
                      labelText: 'Nama Rekening',
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.person),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: colorScheme.primary),
                      ),
                    ),
                    onSaved: (val) => namaRek = val,
                    validator: (val) =>
                        val == null || val.isEmpty ? 'Wajib diisi' : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    initialValue: noRek,
                    decoration: InputDecoration(
                      labelText: 'Nomor Rekening',
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.credit_card),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: colorScheme.primary),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onSaved: (val) => noRek = val,
                    validator: (val) =>
                        val == null || val.isEmpty ? 'Wajib diisi' : null,
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: logoAsset,
                    decoration: InputDecoration(
                      labelText: 'Brand Bank',
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.account_balance),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: colorScheme.primary),
                      ),
                    ),
                    items: bankLogos.map((logo) {
                      return DropdownMenuItem(
                        value: logo,
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/bank/$logo',
                              width: 32,
                              height: 32,
                            ),
                            const SizedBox(width: 12),
                            SizedBox(
                              width: 150,
                              child: Text(
                                logo
                                    .replaceAll('.png', '')
                                    .replaceAll('_', ' '),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                    onChanged: (val) => logoAsset = val,
                    validator: (val) => val == null ? 'Pilih bank' : null,
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: colorScheme.secondary,
                            side: BorderSide(color: colorScheme.secondary),
                          ),
                          child: const Text('BATAL'),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              final updatedCard = CreditCardModel(
                                id: card.id,
                                namaRek: namaRek!,
                                noRek: noRek!,
                                logoAsset: logoAsset!,
                              );
                              await DbService().updateCreditCard(updatedCard);
                              Navigator.pop(context);
                              _loadCards();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: colorScheme.primary,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text('UPDATE'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _deleteCard(int id) async {
    await DbService().deleteCreditCard(id);
    _loadCards();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 32, bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text('Tambah Card'),
                onPressed: _showAddCardDialog,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 300,
          child: PageView.builder(
            controller: _pageController,
            itemCount: cardModels.length,
            itemBuilder: (context, index) {
              final card = cardModels[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: CardCredits(
                  namaRek: card.namaRek,
                  noRek: card.noRek,
                  logoAsset: 'assets/bank/${card.logoAsset}',
                  onDelete: () => _deleteCard(card.id!),
                  onEdit: () => _showEditCardDialog(card),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
