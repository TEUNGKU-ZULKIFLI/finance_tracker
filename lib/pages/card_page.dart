import 'package:flutter/material.dart';
import 'package:finance_tracker/widgets/snackbar.dart';
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

  void _showCustomSnackbar(String message, SnackbarType type) {
    final colorScheme = Theme.of(context).colorScheme;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              type == SnackbarType.success ? Icons.check_circle : Icons.error,
              color: Colors.white,
              size: 20,
            ),
            const SizedBox(width: 12),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: type == SnackbarType.success
            ? colorScheme.primary
            : colorScheme.error,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        duration: const Duration(seconds: 3),
      ),
    );
  }

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
        final textTheme = Theme.of(context).textTheme;
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
                    'Add Credit Card',
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.primary,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Account Name',
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.person),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: colorScheme.primary),
                      ),
                    ),
                    onSaved: (val) => namaRek = val,
                    validator: (val) =>
                        val == null || val.isEmpty ? 'Required' : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Account Number',
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.credit_card),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: colorScheme.primary),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onSaved: (val) => noRek = val,
                    validator: (val) =>
                        val == null || val.isEmpty ? 'Required' : null,
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Bank Brand',
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
                    validator: (val) => val == null ? 'Select bank' : null,
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
                          child: const Text('CANCEL'),
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
                              await DbService().insertHistory(
                                'CREATE_CARD',
                                'Card "${card.namaRek}" successfully created',
                                DateTime.now().toIso8601String(),
                              );
                              _showCustomSnackbar(
                                'Card successfully added!',
                                SnackbarType.success,
                              );
                              // ignore: use_build_context_synchronously
                              Navigator.pop(context);
                              _loadCards();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: colorScheme.primary,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text('SAVE'),
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
        final textTheme = Theme.of(context).textTheme;
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
                    'Edit Credit Card',
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.primary,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    initialValue: namaRek,
                    decoration: InputDecoration(
                      labelText: 'Account Name',
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.person),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: colorScheme.primary),
                      ),
                    ),
                    onSaved: (val) => namaRek = val,
                    validator: (val) =>
                        val == null || val.isEmpty ? 'Required' : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    initialValue: noRek,
                    decoration: InputDecoration(
                      labelText: 'Account Number',
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.credit_card),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: colorScheme.primary),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onSaved: (val) => noRek = val,
                    validator: (val) =>
                        val == null || val.isEmpty ? 'Required' : null,
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    initialValue: logoAsset,
                    decoration: InputDecoration(
                      labelText: 'Bank Brand',
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
                    validator: (val) => val == null ? 'Select bank' : null,
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
                          child: const Text('CANCEL'),
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
                              await DbService().insertHistory(
                                'UPDATE_CARD',
                                'Card "${updatedCard.namaRek}" successfully updated',
                                DateTime.now().toIso8601String(),
                              );
                              _showCustomSnackbar(
                                'Card successfully updated!',
                                SnackbarType.success,
                              );
                              // ignore: use_build_context_synchronously
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

  Future<void> _deleteCard(int id, dynamic card) async {
    await DbService().deleteCreditCard(id);
    await DbService().insertHistory(
      'DELETE_CARD',
      'Card "${card.namaRek}" successfully deleted',
      DateTime.now().toIso8601String(),
    );
    _showCustomSnackbar('Card successfully deleted!', SnackbarType.success);
    _loadCards();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 32, bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text('Add Card'),
                onPressed: _showAddCardDialog,
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primary,
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
                  onDelete: () => _deleteCard(card.id!, card),
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