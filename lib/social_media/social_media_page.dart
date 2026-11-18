import 'package:flutter/material.dart';

class SocialMediaPage extends StatefulWidget {
  final String username;

  const SocialMediaPage({super.key, required this.username});

  @override
  State<SocialMediaPage> createState() => _SocialMediaPageState();
}

class _SocialMediaPageState extends State<SocialMediaPage> {
  void showAccount(BuildContext context, String account) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Selected account: $account')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Social Media')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Text(
            'Connect With Me',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text('Tap an account to display its username.'),
          const SizedBox(height: 20),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.facebook,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: const Text('Facebook'),
              subtitle: const Text('student.sample'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => showAccount(context, 'Facebook: student.sample'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.camera_alt,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: const Text('Instagram'),
              subtitle: const Text('@student.sample'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => showAccount(context, 'Instagram: @student.sample'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.play_circle,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: const Text('YouTube'),
              subtitle: const Text('@StudentChannel'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => showAccount(context, 'YouTube: @StudentChannel'),
            ),
          ),
        ],
      ),
    );
  }
}
