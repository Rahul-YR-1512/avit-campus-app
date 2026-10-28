import 'package:flutter/material.dart';

import '../campus_pages.dart';
import '../models/campus_content.dart';

class ServicesGridScreen extends StatelessWidget {
  const ServicesGridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final services = [
      CampusService(
        id: 'srv-lib',
        label: 'Library',
        icon: Icons.menu_book_rounded,
        destinationBuilder: (_) => const LibraryPage(),
      ),
      CampusService(
        id: 'srv-counsel',
        label: 'Counselling',
        icon: Icons.psychology_alt_rounded,
        destinationBuilder: (_) => const _SimpleInfoPage(
              title: 'Counselling',
              message:
                  'Student counselling services are available. Reach out to the Student Welfare Office for appointments.',
            ),
      ),
      CampusService(
        id: 'srv-accom',
        label: 'Accommodation',
        icon: Icons.hotel_rounded,
        destinationBuilder: (_) => const _SimpleInfoPage(
              title: 'Accommodation',
              message:
                  'Hostel accommodation details, rules and fee information are available at the Hostel Office.',
            ),
      ),
      CampusService(
        id: 'srv-career',
        label: 'Career Services',
        icon: Icons.work_outline_rounded,
        destinationBuilder: (_) => const _SimpleInfoPage(
              title: 'Career Services',
              message:
                  'Career guidance, internships and placement support provided by the Placement Cell.',
            ),
      ),
      CampusService(
        id: 'srv-sports',
        label: 'Sports',
        icon: Icons.sports_soccer_rounded,
        destinationBuilder: (_) => const _SimpleInfoPage(
              title: 'Sports',
              message:
                  'Sports facilities, teams and events managed by the Physical Education Department.',
            ),
      ),
      CampusService(
        id: 'srv-it',
        label: 'IT Helpdesk',
        icon: Icons.computer_rounded,
        destinationBuilder: (_) => const _SimpleInfoPage(
              title: 'IT Helpdesk',
              message:
                  'For Wi-Fi, email, LMS and IT-related issues, contact the campus IT Helpdesk.',
            ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Campus Services'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final columns = constraints.maxWidth >= 700
              ? 4
              : constraints.maxWidth >= 420
                  ? 3
                  : 2;
          return GridView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: services.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.2,
            ),
            itemBuilder: (context, index) {
              final service = services[index];
              return ServiceTile(service: service);
            },
          );
        },
      ),
    );
  }
}

class ServiceTile extends StatelessWidget {
  const ServiceTile({super.key, required this.service});

  final CampusService service;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: service.destinationBuilder),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                service.icon,
                size: 32,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 8),
              Text(
                service.label,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SimpleInfoPage extends StatelessWidget {
  const _SimpleInfoPage({required this.title, required this.message});

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
