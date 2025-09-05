import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        centerTitle: true,
        title: const Text(
          'APOK FINTRACK',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            letterSpacing: 1.2,
          ),
        ),
        elevation: 2,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        children: [
          Center(
            child: Text(
              'SETTING',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: colorScheme.primary,
                letterSpacing: 1.2,
              ),
            ),
          ),
          const SizedBox(height: 32),
          _buildListTile(
            icon: Icons.picture_as_pdf,
            title: 'Export to PDF',
            onTap: () {
              // TODO: Implement export to PDF
            },
          ),
          const Divider(),
          _buildListTile(
            icon: Icons.delete_forever,
            iconColor: Colors.red,
            title: 'Delete All History',
            onTap: () {
              // TODO: Implement delete all history
            },
          ),
          _buildListTile(
            icon: Icons.warning,
            iconColor: Colors.orange,
            title: 'Delete All Data Input',
            onTap: () {
              // TODO: Implement delete all data input
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About Us'),
            onTap: () => _showAboutDialog(context, colorScheme),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.confirmation_number),
            title: const Text('Version'),
            trailing: const Text('v1.0.0'),
          ),
          const Divider(),
          _buildListTile(
            icon: Icons.school,
            title: 'Learning Tutorials',
            onTap: () {
              // TODO: Open tutorial page/link
            },
          ),
          const Divider(),
        ],
      ),
    );
  }

  Widget _buildListTile({
    required IconData icon,
    String? title,
    Color? iconColor,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(title ?? ''),
      onTap: onTap,
    );
  }

  void _showAboutDialog(BuildContext context, ColorScheme colorScheme) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Info',
      transitionDuration: const Duration(milliseconds: 260),
      pageBuilder: (context, anim1, anim2) => const SizedBox.shrink(),
      transitionBuilder: (context, anim1, anim2, child) {
        final scale = Tween<double>(begin: 0.92, end: 1.0).animate(
          CurvedAnimation(parent: anim1, curve: Curves.easeOutBack),
        );
        final fade = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: anim1, curve: Curves.easeOut),
        );
        return Transform.scale(
          scale: scale.value,
          child: Opacity(
            opacity: fade.value,
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              backgroundColor: colorScheme.surface.withOpacity(0.98),
              elevation: 16,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 32,
                horizontal: 24,
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          colorScheme.primary,
                          colorScheme.secondary,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: colorScheme.primary.withOpacity(0.25),
                          blurRadius: 16,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(4),
                    child: const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/dev/teungku.JPG'),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    'APOK FINANCE TRACKER',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: colorScheme.primary,
                      letterSpacing: 1.5,
                      shadows: [
                        Shadow(
                          color: colorScheme.primary.withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Divider(
                    thickness: 1.2,
                    color: colorScheme.primary.withOpacity(0.18),
                    indent: 24,
                    endIndent: 24,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '© 2025 TEUNGKU ZULKIFLI. All Rights Reserved.',
                    style: TextStyle(
                      fontSize: 13,
                      color: colorScheme.secondary,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  // const SizedBox(height: 16),
                  // _DevLinkTile(
                  //   asset: 'assets/dev/github.ico',
                  //   label: 'GitHub',
                  //   url: 'https://github.com/TEUNGKU-ZULKIFLI',
                  //   subtitle: 'github.com/TEUNGKU-ZULKIFLI',
                  //   color: colorScheme.primary,
                  // ),
                  // _DevLinkTile(
                  //   asset: 'assets/dev/linked.ico',
                  //   label: 'LinkedIn',
                  //   url: 'https://www.linkedin.com/in/teungku-zulkifli08/',
                  //   subtitle: 'in/teungku-zulkifli',
                  //   color: colorScheme.secondary,
                  // ),
                ],
              ),
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                TextButton(
                  child: Text(
                    'Tutup',
                    style: TextStyle(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
