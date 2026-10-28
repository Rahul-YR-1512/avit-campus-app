import 'package:flutter/material.dart';

import 'campus_pages.dart';
import 'screens/announcements_screen.dart';
import 'screens/services_grid_screen.dart';

bool firebaseReady = false;

class FirebaseStartupErrorApp extends StatelessWidget {
  final String error;

  const FirebaseStartupErrorApp({
    super.key,
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Firebase Startup Error'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: SelectableText(
              'Firebase could not start.\n\n$error',
            ),
          ),
        ),
      ),
    );
  }
}

class AppRoutes {
  static const String request = '/request';
  static const String feedback = '/feedback';
  static const String calendar = '/calendar';
  static const String timetable = '/timetable';
  static const String services = '/services';
  static const String events = '/events';
  static const String profile = '/profile';
  static const String announcements = '/announcements';
  static const String servicesGrid = '/services-grid';
}

final Map<String, WidgetBuilder> campusRoutes = {
  AppRoutes.request: (_) => const ServiceRequestPage(),
  AppRoutes.feedback: (_) => const FeedbackPage(),
  AppRoutes.calendar: (_) => const CalendarPage(),
  AppRoutes.timetable: (_) => const TimetablePage(),
  AppRoutes.services: (_) => const ServicesPage(),
  AppRoutes.events: (_) => const EventsPage(),
  AppRoutes.profile: (_) => const ProfilePage(),
  AppRoutes.announcements: (_) => const AnnouncementsScreen(),
  AppRoutes.servicesGrid: (_) => const ServicesGridScreen(),
};

Route<dynamic>? campusOnGenerateRoute(RouteSettings settings) {
  return null;
}

Route<dynamic> campusOnUnknownRoute(RouteSettings settings) {
  return MaterialPageRoute(
    builder: (_) => Scaffold(
      appBar: AppBar(
        title: const Text('Page Not Found'),
      ),
      body: Center(
        child: Text(
          'No page found for ${settings.name}',
        ),
      ),
    ),
  );
}

class CampusDashboardPanel extends StatelessWidget {
  final dynamic profile;
  final VoidCallback? onOpenTimetable;
  final VoidCallback? onOpenServices;
  final VoidCallback? onOpenEvents;
  final VoidCallback? onOpenAnnouncement;

  const CampusDashboardPanel({
    super.key,
    this.profile,
    this.onOpenTimetable,
    this.onOpenServices,
    this.onOpenEvents,
    this.onOpenAnnouncement,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Campus Dashboard',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: CampusActionCard(
                    icon: Icons.schedule,
                    title: 'Timetable',
                    subtitle: 'Your weekly classes',
                    color: const Color(0xFF00796B),
                    onTap: onOpenTimetable,
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: CampusActionCard(
                    icon: Icons.miscellaneous_services,
                    title: 'Services',
                    subtitle: 'Browse campus services',
                    color: const Color(0xFFE65100),
                    onTap: onOpenServices,
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: CampusActionCard(
                    icon: Icons.event,
                    title: 'Events',
                    subtitle: 'Register for activities',
                    color: const Color(0xFF6A1B9A),
                    onTap: onOpenEvents,
                  ),
                ),
                const SizedBox(width: 10),

                Expanded(
                  child: CampusActionCard(
                    icon: Icons.campaign,
                    title: 'Announcements',
                    subtitle: 'View campus announcements',
                    color: const Color(0xFF1565C0),
                    onTap: onOpenAnnouncement,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CampusActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color? color;
  final VoidCallback? onTap;

  const CampusActionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              Icon(
                icon,
                size: 30,
                color: color,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}