import 'package:flutter/material.dart';
import 'package:matrimony/Design/utils/colors.dart';

class UserDetails extends StatelessWidget {
  final Map<String, String> userData;

  const UserDetails({Key? key, required this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> about = [
      {'title': 'Name', 'subtitle': userData['fullName'] ?? 'N/A', 'icon': Icons.person},
      {'title': 'Gender', 'subtitle': userData['gender'] ?? 'N/A', 'icon': Icons.male},
      {'title': 'Date of Birth', 'subtitle': userData['dateOfBirth'] ?? 'N/A', 'icon': Icons.calendar_today},
      {'title': 'Marital Status', 'subtitle': userData['maritalStatus'] ?? 'N/A', 'icon': Icons.favorite},
      {'title': 'Mother Tongue', 'subtitle': userData['motherTongue'] ?? 'N/A', 'icon': Icons.language},
    ];

    final List<Map<String, dynamic>> religiousBackground = [
      {'title': 'Address', 'subtitle': userData['address'] ?? 'N/A', 'icon': Icons.flag},
      {'title': 'City', 'subtitle': userData['city'] ?? 'N/A', 'icon': Icons.map},
      {'title': 'Religion', 'subtitle': userData['religion'] ?? 'N/A', 'icon': Icons.book},
      {'title': 'Caste', 'subtitle': userData['caste'] ?? 'N/A', 'icon': Icons.group},
      {'title': 'Sub Caste', 'subtitle': userData['subCaste'] ?? 'N/A', 'icon': Icons.group_work},
    ];

    final List<Map<String, dynamic>> professionalDetails = [
      {'title': 'Higher Education', 'subtitle': userData['higherEducation'] ?? 'N/A', 'icon': Icons.school},
      {'title': 'Occupation', 'subtitle': userData['occupation'] ?? 'N/A', 'icon': Icons.work},
      {'title': 'Annual Income', 'subtitle': userData['annualIncome'] ?? 'N/A', 'icon': Icons.attach_money},
    ];

    final List<Map<String, dynamic>> contactDetails = [
      {'title': 'Email', 'subtitle': userData['email'] ?? 'N/A', 'icon': Icons.email},
      {'title': 'Phone', 'subtitle': userData['mobile'] ?? 'N/A', 'icon': Icons.phone},
    ];

    final List<Map<String, dynamic>> personalInterests = [
      {'title': 'Hobbies', 'subtitle': userData['hobbies'] ?? 'N/A', 'icon': Icons.sports_esports},
    ];


    Widget buildSection(String title, List<Map<String, dynamic>> details) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: THEMECOLOR),
          ),
          const SizedBox(height: 10),
          ...details.map(
                (item) => Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: Icon(item['icon'], color: THEMECOLOR),
                title: Text(item['title'], style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(item['subtitle']),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: THEMECOLOR,
        title: Text(
          "User Details",
          style: TextStyle(color: TEXTCOLOR, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            buildSection('About', about),
            buildSection('Religious Background', religiousBackground),
            buildSection('Professional Details', professionalDetails),
            buildSection('Contact Details', contactDetails),
          ],
        ),
      ),
    );
  }
}
