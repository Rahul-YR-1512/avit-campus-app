import 'package:flutter/material.dart';

import 'main.dart';

class EditProfilePage extends StatefulWidget {
  final UserProfile profile;

  const EditProfilePage({
    super.key,
    required this.profile,
  });

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController(text: widget.profile.name);
    emailController = TextEditingController(text: widget.profile.email);
    phoneController = TextEditingController(text: widget.profile.phone);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: phoneController,
            decoration: const InputDecoration(
              labelText: 'Phone',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Save Profile'),
          ),
        ],
      ),
    );
  }
}

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Library'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          Card(
            child: ListTile(
              leading: Icon(Icons.menu_book),
              title: Text('Digital Library'),
              subtitle: Text('Access books and learning resources'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.computer),
              title: Text('Computer Section'),
              subtitle: Text('Computers and digital resources'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.local_library),
              title: Text('Study Area'),
              subtitle: Text('Quiet study spaces available'),
            ),
          ),
        ],
      ),
    );
  }
}

class CafeteriaPage extends StatelessWidget {
  const CafeteriaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cafeteria'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          Card(
            child: ListTile(
              leading: Icon(Icons.restaurant),
              title: Text('Main Cafeteria'),
              subtitle: Text('Breakfast, lunch and snacks'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.local_cafe),
              title: Text('Cafe'),
              subtitle: Text('Drinks and refreshments'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.schedule),
              title: Text('Opening Hours'),
              subtitle: Text('Monday - Saturday'),
            ),
          ),
        ],
      ),
    );
  }
}

class CampusMapPage extends StatelessWidget {
  final void Function(String message)? onSelect;

  const CampusMapPage({
    super.key,
    this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final locations = [
      'Main Building',
      'Library',
      'Cafeteria',
      'Computer Lab',
      'Auditorium',
      'Sports Ground',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Campus Map'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: locations.length,
        itemBuilder: (context, index) {
          final location = locations[index];

          return Card(
            child: ListTile(
              leading: const Icon(Icons.location_on),
              title: Text(location),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                onSelect?.call('$location selected');

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$location selected'),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  final dynamic profile;
  final dynamic notificationMode;
  final ValueChanged<dynamic>? onChanged;

  const SettingsPage({
    super.key,
    this.profile,
    this.notificationMode,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Notifications'),
            subtitle: const Text('Receive campus notifications'),
            value: true,
            onChanged: (value) {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Language'),
            subtitle: const Text('English'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.security),
            title: const Text('Privacy & Security'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About AVIT Campus'),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: 'AVIT Campus',
                applicationVersion: '1.0.0',
                applicationLegalese: 'AVIT Campus App',
              );
            },
          ),
        ],
      ),
    );
  }
}

class ServiceRequestPage extends StatelessWidget {
  const ServiceRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _SimpleCampusPage(
      title: 'Service Request',
      icon: Icons.build,
      message: 'Submit a request for campus services.',
    );
  }
}

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _SimpleCampusPage(
      title: 'Feedback',
      icon: Icons.feedback,
      message: 'Share your feedback about the campus.',
    );
  }
}

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _SimpleCampusPage(
      title: 'Calendar',
      icon: Icons.calendar_month,
      message: 'View your campus calendar and activities.',
    );
  }
}

class TimetablePage extends StatelessWidget {
  const TimetablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return _SimpleCampusPage(
      title: 'Timetable',
      icon: Icons.schedule,
      message: 'View your class timetable.',
    );
  }
}

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _SimpleCampusPage(
      title: 'Campus Services',
      icon: Icons.miscellaneous_services,
      message: 'Explore available campus services.',
    );
  }
}

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _SimpleCampusPage(
      title: 'Events',
      icon: Icons.event,
      message: 'View upcoming campus events.',
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return _SimpleCampusPage(
      title: 'Profile',
      icon: Icons.person,
      message: 'View your student profile.',
    );
  }
}

class _SimpleCampusPage extends StatelessWidget {
  final String title;
  final IconData icon;
  final String message;

  const _SimpleCampusPage({
    required this.title,
    required this.icon,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 70,
              ),
              const SizedBox(height: 20),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                message,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}