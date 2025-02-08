import 'package:flutter/material.dart';
import 'package:matrimony/Design/MenuDrawer.dart';
import 'package:matrimony/Design/utils/colors.dart';
// import 'package:matrimony/Design/utils/colors.dart';

class Aboutus extends StatelessWidget {
  final List<Map<String, dynamic>> teamMembers = [
    {'role': 'Developed by', 'name': 'Harmik Rathod (24010101680)', 'icon': Icons.code},
    {'role': 'Mentored by', 'name': 'Prof. Mehul Bhundiya (Computer Engineering Department), \nSchool of Computer Science', 'icon': Icons.school},
    {'role': 'Explored by', 'name': '-', 'icon': Icons.explore},
    {'role': 'Eulogized by', 'name': 'Darshan University, Rajkot, Gujarat - INDIA', 'icon': Icons.location_city},
  ];

  final List<Map<String, dynamic>> items = [
    {'icon': Icons.email, 'title': 'Email Us', 'subtitle': 'soulmate_hub@darshan.ac.in'},
    {'icon': Icons.phone, 'title': 'Call Us', 'subtitle': '+91-9727747317'},
    {'icon': Icons.language, 'title': 'Visit Website', 'subtitle': 'www.darshan.ac.in'},
    // {'icon': Icons.share, 'title': 'Share', 'subtitle': 'Share our app with friends'},
  ];

  String aboutData = '''Soulmate Hub is a powerful and intuitive admin panel application designed to efficiently manage user data and interactions. Whether you're overseeing a matchmaking service, community, or any platform requiring user management, Soulmate Hub provides all the tools you need in a single, user-friendly interface.''';

  String vision = '''At Soulmate Hub, our goal is to empower administrators with the tools they need to connect people effectively and manage user data efficiently. We aim to simplify user management while ensuring a seamless experience for both administrators and users.''';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: THEMECOLOR,
          title: const Text(
            'About Us',
            style: TextStyle(color: TEXTCOLOR,fontWeight: FontWeight.bold,
            ),
          ),
        ),
        drawer: MenuDrawer(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Logo and Header Section
                Center(
                  child: Column(
                    children: [

                      // Image.asset(
                      //   'assets/images/Logo.png', // Ensure the image exists in the assets folder
                      //   height: 100,
                      //   width: 100,
                      // ),
                      const SizedBox(height: 16),
                      Text(
                        'Meet Our Team',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: THEMECOLOR,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Dynamic Team Information
                ...teamMembers.map(
                      (member) => Card(
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: Icon(member['icon'], color: THEMECOLOR),
                      title: Text(
                        member['role']!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(member['name']!),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // About Soulmate Hub Section
                Center(
                  child: Column(
                    children: [
                      Text(
                        'About Soulmate Hub',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: THEMECOLOR,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Card(
                        elevation: 5,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            aboutData,
                            style: TextStyle(fontSize: 16, height: 1.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Vision Section
                Center(
                  child: Column(
                    children: [
                      Text(
                        'Vision',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: THEMECOLOR,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Card(
                        elevation: 5,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            vision,
                            style: TextStyle(fontSize: 16, height: 1.5),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: Column(
                          children: [

                            const SizedBox(height: 16),
                            Text(
                              'Meet Our Team',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: THEMECOLOR,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Dynamic Team Information
                      ...items.map(
                            (item) => Card(
                          elevation: 5,
                          margin: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            leading: Icon(item['icon'], color: THEMECOLOR),
                            title: Text(
                              item['title']!,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(item['subtitle']!),
                          ),
                        ),
                      ),
                        Column(
                        mainAxisAlignment: MainAxisAlignment.end,
    children: [
    Card(
    margin: const EdgeInsets.all(16),
    elevation: 4,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
    mainAxisSize: MainAxisSize.min,
    children: const [
    ListTile(
    leading: Icon(Icons.share),
    title: Text('Share App'),
    ),
    Divider(),
    ListTile(
    leading: Icon(Icons.apps),
    title: Text('More Apps'),
    ),
    Divider(),
    ListTile(
    leading: Icon(Icons.star_rate),
    title: Text('Rate Us'),
    ),
    Divider(),
    ListTile(
    leading: Icon(Icons.thumb_up),
    title: Text('Like us on Facebook'),
    ),
    Divider(),
    ListTile(
    leading: Icon(Icons.update),
    title: Text('Check For Update'),
    ),
    ],
    ),
    ),
    const Padding(
    padding: EdgeInsets.symmetric(vertical: 16),
    child: Column(
    children: [
    Text(
    '© 2025 Darshan University',
    style: TextStyle(fontSize: 12, color: Colors.grey),
    ),
    Text(
    'All Rights Reserved - Privacy Policy',
    style: TextStyle(fontSize: 12, color: Colors.grey),
    ),
    Text(
    'Made with ❤️ in India',
    style: TextStyle(fontSize: 12, color: Colors.grey),
    ),
    ],
    ),
    ),
    ],
    ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
