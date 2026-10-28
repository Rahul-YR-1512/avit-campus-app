import 'package:flutter/material.dart';

class Announcement {
  const Announcement({
    required this.id,
    required this.title,
    required this.category,
    required this.date,
    required this.preview,
    required this.detail,
  });

  final String id;
  final String title;
  final String category;
  final String date;
  final String preview;
  final String detail;
}

class CampusService {
  const CampusService({
    required this.id,
    required this.label,
    required this.icon,
    required this.destinationBuilder,
  });

  final String id;
  final String label;
  final IconData icon;
  final WidgetBuilder destinationBuilder;
}

const List<Announcement> demoAnnouncements = [
  Announcement(
    id: 'ann-001',
    title: 'Semester Examination Registration',
    category: 'Exams',
    date: '15 Oct 2026',
    preview: 'Registration portal is now open for all eligible students.',
    detail:
        'Semester examination registration is open through the student portal. '
        'Ensure fee clearance and course registration are completed before the deadline. '
        'Contact the Examination Cell for clarifications.',
  ),
  Announcement(
    id: 'ann-002',
    title: 'AI & ML Workshop',
    category: 'Workshop',
    date: '25 Sep 2026',
    preview: 'Hands-on session on Agentic AI and real-world use cases.',
    detail:
        'The Department of CSE (AI & ML) is conducting a hands-on workshop on Agentic AI. '
        'Limited seats available. Register at the department office or via the Events page.',
  ),
  Announcement(
    id: 'ann-003',
    title: 'Campus Placement Drive',
    category: 'Placements',
    date: '05 Oct 2026',
    preview: 'Leading IT companies visiting for on-campus recruitment.',
    detail:
        'A multi-company placement drive is scheduled. Eligible pre-final/final year students '
        'must update their resumes on the placement portal and attend the pre-placement briefing.',
  ),
  Announcement(
    id: 'ann-004',
    title: 'Library Extended Hours',
    category: 'Library',
    date: '18 Sep 2026',
    preview: 'Reading rooms open until 9 PM during exam preparation week.',
    detail:
        'To support exam preparation, the Central Library will remain open until 9:00 PM '
        'for the next two weeks. ID cards must be carried for access.',
  ),
  Announcement(
    id: 'ann-005',
    title: 'Sports Carnival',
    category: 'Sports',
    date: '28 Sep 2026',
    preview: 'Inter-department tournaments and fun games for all students.',
    detail:
        'AVIT Sports Carnival includes track & field, volleyball, basketball, cricket and '
        'recreational events. Register your department team with the Physical Education Department.',
  ),
  Announcement(
    id: 'ann-006',
    title: 'Career Development Programme',
    category: 'Career',
    date: '02 Oct 2026',
    preview: 'Resume building, aptitude and interview skills session.',
    detail:
        'A career development programme focusing on resume writing, aptitude training and '
        'mock interviews will be held at the AVIT Auditorium. Open to all students.',
  ),
  Announcement(
    id: 'ann-007',
    title: 'Cafeteria Menu Update',
    category: 'Cafeteria',
    date: '12 Sep 2026',
    preview: 'New healthy meal options added to the main cafeteria.',
    detail:
        'The main cafeteria now offers additional vegetarian and protein-rich meal options. '
        'Feedback on menu items is welcome at the cafeteria help desk.',
  ),
  Announcement(
    id: 'ann-008',
    title: 'IT Helpdesk Maintenance Window',
    category: 'IT',
    date: '10 Oct 2026',
    preview: 'Network maintenance scheduled from 12 AM to 4 AM.',
    detail:
        'Campus Wi-Fi and some online services may be intermittently unavailable during '
        'the scheduled maintenance window. Plan accordingly.',
  ),
];
