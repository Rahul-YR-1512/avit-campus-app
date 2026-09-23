import 'package:flutter/material.dart';

void main() {
  runApp(const AVITCampusApp());
}

class AVITCampusApp extends StatelessWidget {
  const AVITCampusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AVIT Campus',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0B3D91),
        ),
        scaffoldBackgroundColor: const Color(0xFFF4F7FB),
      ),
      home: const CampusHomePage(),
    );
  }
}

class CampusHomePage extends StatefulWidget {
  const CampusHomePage({super.key});

  @override
  State<CampusHomePage> createState() => _CampusHomePageState();
}

class _CampusHomePageState extends State<CampusHomePage> {
  // ============================================================
  // AVIT COLORS
  // ============================================================

  static const Color primaryBlue = Color(0xFF0B3D91);
  static const Color darkBlue = Color(0xFF062A63);
  static const Color gold = Color(0xFFF4B400);
  static const Color lightBlue = Color(0xFFE8F0FE);

  // ============================================================
  // NAVIGATION
  // ============================================================

  int currentIndex = 0;

  final List<String> pageTitles = [
    'AVIT Campus',
    'AVIT Activities',
    'My Profile',
  ];

  // ============================================================
  // ACTIVITIES
  // ============================================================

  final List<Map<String, dynamic>> activities = [
    {
      'title': 'AI & Machine Learning Workshop',
      'date': '25 September 2026',
      'time': '10:00 AM',
      'location': 'AI Lab',
      'icon': Icons.smart_toy,
      'registered': false,
    },
    {
      'title': 'AVIT Sports Carnival',
      'date': '28 September 2026',
      'time': '3:00 PM',
      'location': 'Sports Ground',
      'icon': Icons.sports_soccer,
      'registered': false,
    },
    {
      'title': 'Career Development Programme',
      'date': '02 October 2026',
      'time': '2:00 PM',
      'location': 'AVIT Auditorium',
      'icon': Icons.work,
      'registered': false,
    },
  ];

  // ============================================================
  // SNACKBAR
  // ============================================================

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor: darkBlue,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  // ============================================================
  // REGISTER ACTIVITY
  // ============================================================

  void registerActivity(int index) {
    setState(() {
      activities[index]['registered'] =
      !activities[index]['registered'];
    });

    if (activities[index]['registered']) {
      showMessage(
        '${activities[index]['title']} registered successfully!',
      );
    } else {
      showMessage('Registration cancelled.');
    }
  }

  // ============================================================
  // ADD ACTIVITY
  // ============================================================

  void addActivity() {
    setState(() {
      activities.add({
        'title': 'AVIT Innovation Meetup',
        'date': '05 October 2026',
        'time': '11:00 AM',
        'location': 'Student Activity Centre',
        'icon': Icons.lightbulb,
        'registered': false,
      });
    });

    showMessage('New AVIT activity added successfully!');
  }

  // ============================================================
  // CHANGE PAGE
  // ============================================================

  void selectPage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // ========================================================
      // APP BAR
      // ========================================================

      appBar: AppBar(
        title: Text(
          pageTitles[currentIndex],
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 21,
          ),
        ),
        backgroundColor: primaryBlue,
        foregroundColor: Colors.white,
        elevation: 4,

        actions: [
          IconButton(
            tooltip: 'Notifications',
            icon: const Icon(
              Icons.notifications_outlined,
            ),
            onPressed: () {
              showMessage(
                'You have 3 new AVIT notifications',
              );
            },
          ),
        ],
      ),

      // ========================================================
      // NAVIGATION DRAWER
      // ========================================================

      drawer: Drawer(
        child: Column(
          children: [

            // Drawer Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                top: 55,
                bottom: 25,
                left: 20,
                right: 20,
              ),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    darkBlue,
                    primaryBlue,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),

              child: const Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [

                  CircleAvatar(
                    radius: 38,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.school,
                      size: 45,
                      color: primaryBlue,
                    ),
                  ),

                  SizedBox(height: 15),

                  Text(
                    'AVIT Campus',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 5),

                  Text(
                    'Student Campus Application',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),

            // Home
            ListTile(
              leading: const Icon(
                Icons.home_outlined,
                color: primaryBlue,
              ),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
                selectPage(0);
              },
            ),

            // Activities
            ListTile(
              leading: const Icon(
                Icons.event_outlined,
                color: primaryBlue,
              ),
              title: const Text('Activities'),
              onTap: () {
                Navigator.pop(context);
                selectPage(1);
              },
            ),

            // Profile
            ListTile(
              leading: const Icon(
                Icons.person_outline,
                color: primaryBlue,
              ),
              title: const Text('My Profile'),
              onTap: () {
                Navigator.pop(context);
                selectPage(2);
              },
            ),

            // Calendar
            ListTile(
              leading: const Icon(
                Icons.calendar_month_outlined,
                color: primaryBlue,
              ),
              title: const Text('Academic Calendar'),
              onTap: () {
                Navigator.pop(context);
                showMessage(
                  'Academic Calendar selected',
                );
              },
            ),

            // Settings
            ListTile(
              leading: const Icon(
                Icons.settings_outlined,
                color: primaryBlue,
              ),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                showMessage('Settings selected');
              },
            ),

            // Help
            ListTile(
              leading: const Icon(
                Icons.help_outline,
                color: primaryBlue,
              ),
              title: const Text('Help Centre'),
              onTap: () {
                Navigator.pop(context);
                showMessage(
                  'AVIT Help Centre selected',
                );
              },
            ),
          ],
        ),
      ),

      // ========================================================
      // BODY
      // ========================================================

      body: IndexedStack(
        index: currentIndex,
        children: [
          buildHomePage(),
          buildActivitiesPage(),
          buildProfilePage(),
        ],
      ),

      // ========================================================
      // FLOATING ACTION BUTTON
      // ========================================================

      floatingActionButton: currentIndex == 1
          ? FloatingActionButton.extended(
        onPressed: addActivity,
        backgroundColor: gold,
        foregroundColor: darkBlue,
        icon: const Icon(Icons.add),
        label: const Text(
          'Add Activity',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      )
          : FloatingActionButton(
        onPressed: () {
          showMessage(
            'Quick AVIT campus action selected',
          );
        },
        backgroundColor: gold,
        foregroundColor: darkBlue,
        child: const Icon(Icons.add),
      ),

      // ========================================================
      // BOTTOM NAVIGATION BAR
      // ========================================================

      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: selectPage,
        backgroundColor: Colors.white,
        indicatorColor: lightBlue,

        destinations: const [

          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(
              Icons.home,
              color: primaryBlue,
            ),
            label: 'Home',
          ),

          NavigationDestination(
            icon: Icon(Icons.event_outlined),
            selectedIcon: Icon(
              Icons.event,
              color: primaryBlue,
            ),
            label: 'Activities',
          ),

          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(
              Icons.person,
              color: primaryBlue,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // ============================================================
  // HOME PAGE
  // ============================================================

  Widget buildHomePage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),

      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [

          // Welcome Card
          Container(
            width: double.infinity,

            padding: const EdgeInsets.all(22),

            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  darkBlue,
                  primaryBlue,
                ],
              ),

              borderRadius:
              BorderRadius.circular(22),

              boxShadow: [
                BoxShadow(
                  color:
                  Colors.black.withOpacity(0.12),
                  blurRadius: 10,
                  offset:
                  const Offset(0, 5),
                ),
              ],
            ),

            child: const Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                Row(
                  children: [

                    CircleAvatar(
                      radius: 25,
                      backgroundColor:
                      Colors.white,

                      child: Icon(
                        Icons.school,
                        color: primaryBlue,
                        size: 30,
                      ),
                    ),

                    SizedBox(width: 12),

                    Text(
                      'AVIT',
                      style: TextStyle(
                        color: gold,
                        fontSize: 24,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 18),

                Text(
                  'Welcome back, Rahul! 👋',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),

                SizedBox(height: 7),

                Text(
                  '3rd Year • CSE - Artificial Intelligence & ML',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),

                SizedBox(height: 5),

                Text(
                  'AVIT Student Campus',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          const Text(
            'Campus Services',
            style: TextStyle(
              fontSize: 21,
              fontWeight:
              FontWeight.bold,
              color: darkBlue,
            ),
          ),

          const SizedBox(height: 12),

          Row(
            children: [

              Expanded(
                child: serviceCard(
                  icon: Icons.library_books,
                  title: 'Library',
                  subtitle:
                  'Open until 9 PM',
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: serviceCard(
                  icon: Icons.restaurant,
                  title: 'Cafeteria',
                  subtitle:
                  'Open now',
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            children: [

              Expanded(
                child: serviceCard(
                  icon: Icons.map,
                  title: 'Campus Map',
                  subtitle:
                  'Find locations',
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: serviceCard(
                  icon: Icons.support_agent,
                  title: 'IT Helpdesk',
                  subtitle:
                  'Get support',
                ),
              ),
            ],
          ),

          const SizedBox(height: 25),

          const Text(
            'AVIT Announcements',
            style: TextStyle(
              fontSize: 21,
              fontWeight:
              FontWeight.bold,
              color: darkBlue,
            ),
          ),

          const SizedBox(height: 10),

          announcementCard(
            Icons.campaign,
            'Exam Registration',
            'Semester examination registration is now open.',
          ),

          announcementCard(
            Icons.menu_book,
            'Library Notice',
            'Library timings have been extended during exams.',
          ),

          announcementCard(
            Icons.groups,
            'Club Recruitment',
            'Join AVIT student clubs and societies.',
          ),
        ],
      ),
    );
  }

  // ============================================================
  // SERVICE CARD
  // ============================================================

  Widget serviceCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Card(
      elevation: 2,

      shape: RoundedRectangleBorder(
        borderRadius:
        BorderRadius.circular(17),
      ),

      child: Padding(
        padding:
        const EdgeInsets.all(15),

        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [

            CircleAvatar(
              radius: 23,
              backgroundColor:
              lightBlue,

              child: Icon(
                icon,
                color: primaryBlue,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              title,
              style: const TextStyle(
                fontWeight:
                FontWeight.bold,
                fontSize: 16,
                color: darkBlue,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              subtitle,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // ANNOUNCEMENT CARD
  // ============================================================

  Widget announcementCard(
      IconData icon,
      String title,
      String description,
      ) {
    return Card(
      margin:
      const EdgeInsets.only(bottom: 10),

      elevation: 1,

      child: ListTile(

        leading: CircleAvatar(
          backgroundColor:
          lightBlue,

          child: Icon(
            icon,
            color: primaryBlue,
          ),
        ),

        title: Text(
          title,
          style: const TextStyle(
            fontWeight:
            FontWeight.bold,
            color: darkBlue,
          ),
        ),

        subtitle:
        Text(description),

        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 15,
        ),

        onTap: () {
          showMessage(
            '$title selected',
          );
        },
      ),
    );
  }

  // ============================================================
  // ACTIVITIES PAGE
  // ============================================================

  Widget buildActivitiesPage() {
    return ListView.builder(

      padding:
      const EdgeInsets.all(16),

      itemCount:
      activities.length,

      itemBuilder:
          (context, index) {

        final activity =
        activities[index];

        return Card(

          margin:
          const EdgeInsets.only(
              bottom: 15),

          elevation: 2,

          shape:
          RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(18),
          ),

          child: Padding(

            padding:
            const EdgeInsets.all(16),

            child: Column(
              children: [

                Row(
                  children: [

                    CircleAvatar(
                      radius: 29,
                      backgroundColor:
                      lightBlue,

                      child: Icon(
                        activity['icon'],
                        color: primaryBlue,
                        size: 28,
                      ),
                    ),

                    const SizedBox(width: 14),

                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,

                        children: [

                          Text(
                            activity['title'],
                            style:
                            const TextStyle(
                              fontSize: 17,
                              fontWeight:
                              FontWeight.bold,
                              color: darkBlue,
                            ),
                          ),

                          const SizedBox(height: 5),

                          Text(
                            activity['date'],
                            style:
                            const TextStyle(
                              color:
                              Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Icon(
                      activity['registered']
                          ? Icons.bookmark
                          : Icons.bookmark_border,

                      color:
                      activity['registered']
                          ? gold
                          : Colors.grey,
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                Row(
                  children: [

                    const Icon(
                      Icons.access_time,
                      size: 18,
                      color: primaryBlue,
                    ),

                    const SizedBox(width: 6),

                    Text(
                      activity['time'],
                    ),

                    const SizedBox(width: 20),

                    const Icon(
                      Icons.location_on_outlined,
                      size: 18,
                      color: primaryBlue,
                    ),

                    const SizedBox(width: 6),

                    Expanded(
                      child: Text(
                        activity['location'],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 14),

                SizedBox(
                  width: double.infinity,

                  child:
                  ElevatedButton.icon(

                    style:
                    ElevatedButton.styleFrom(
                      backgroundColor:
                      primaryBlue,
                      foregroundColor:
                      Colors.white,
                    ),

                    onPressed: () =>
                        registerActivity(
                          index,
                        ),

                    icon: Icon(
                      activity['registered']
                          ? Icons.check
                          : Icons.app_registration,
                    ),

                    label: Text(
                      activity['registered']
                          ? 'Registered'
                          : 'Register',
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // ============================================================
  // PROFILE PAGE
  // ============================================================

  Widget buildProfilePage() {
    return SingleChildScrollView(

      padding:
      const EdgeInsets.all(16),

      child: Column(
        children: [

          const SizedBox(height: 10),

          const CircleAvatar(
            radius: 55,
            backgroundColor:
            lightBlue,

            child: Icon(
              Icons.person,
              size: 65,
              color: primaryBlue,
            ),
          ),

          const SizedBox(height: 15),

          const Text(
            'Rahul Y',
            style: TextStyle(
              fontSize: 25,
              fontWeight:
              FontWeight.bold,
              color: darkBlue,
            ),
          ),

          const SizedBox(height: 5),

          const Text(
            '3rd Year',
            style: TextStyle(
              color: gold,
              fontWeight:
              FontWeight.bold,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 5),

          const Text(
            'CSE - Artificial Intelligence & ML',
            textAlign:
            TextAlign.center,

            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),

          const SizedBox(height: 25),

          profileItem(
            Icons.badge_outlined,
            'Student ID',
            'AVIT-CSE-AIML-2024',
          ),

          profileItem(
            Icons.school_outlined,
            'College',
            'AVIT',
          ),

          profileItem(
            Icons.computer,
            'Programme',
            'Computer Science & Engineering - AI & ML',
          ),

          profileItem(
            Icons.calendar_month_outlined,
            'Year',
            '3rd Year',
          ),

          profileItem(
            Icons.email_outlined,
            'Email',
            'rahul@student.avit.ac.in',
          ),

          const SizedBox(height: 15),

          SizedBox(
            width: double.infinity,

            child:
            ElevatedButton.icon(

              style:
              ElevatedButton.styleFrom(
                backgroundColor:
                primaryBlue,

                foregroundColor:
                Colors.white,

                padding:
                const EdgeInsets.symmetric(
                  vertical: 14,
                ),
              ),

              onPressed: () {
                showMessage(
                  'Profile updated successfully!',
                );
              },

              icon:
              const Icon(Icons.edit),

              label:
              const Text(
                'Update Profile',
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // PROFILE ITEM
  // ============================================================

  Widget profileItem(
      IconData icon,
      String title,
      String value,
      ) {
    return Card(

      margin:
      const EdgeInsets.only(
          bottom: 10),

      elevation: 1,

      child: ListTile(

        leading: CircleAvatar(

          backgroundColor:
          lightBlue,

          child: Icon(
            icon,
            color: primaryBlue,
          ),
        ),

        title: Text(
          title,
          style:
          const TextStyle(
            color: Colors.grey,
            fontSize: 13,
          ),
        ),

        subtitle: Text(
          value,
          style:
          const TextStyle(
            color: darkBlue,
            fontWeight:
            FontWeight.w600,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}