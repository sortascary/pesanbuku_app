import 'package:flutter/material.dart';
import 'update_profile_page.dart'; // Pastikan Anda mengimpor halaman UpdateProfilePage

class ProfilePage extends StatelessWidget {
  final String userRole;

  const ProfilePage({super.key, required this.userRole});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold, 
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false, 
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProfileHeader(context),
              const SizedBox(height: 20),
              _buildProfileOptions(),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                child: Text(
                  "More",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
              _buildMoreOptions(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage("assets/Images/profile.png"),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              "User Name",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UpdateProfilePage(userRole: userRole),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProfileOptions() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          _buildListTile(Icons.person, 'My Account', 'Make changes to your account'),
          if (userRole == "admin")
            _buildListTile(Icons.people, 'Saved Beneficiary', 'Manage your saved account'),
          if (userRole == "admin")
            _buildSwitchTile(Icons.calculate, 'Auto Calculate', 'Toggle auto calculating for stock'),
          _buildListTile(Icons.logout, 'Log out', 'Exit out of account'),
        ],
      ),
    );
  }

  Widget _buildMoreOptions() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          _buildListTile(Icons.help, 'Help & Support', ''),
          _buildListTile(Icons.info, 'About App', ''),
        ],
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(icon, color: Colors.deepPurple),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: subtitle.isNotEmpty ? Text(subtitle, style: const TextStyle(fontSize: 12)) : null,
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
    );
  }

  Widget _buildSwitchTile(IconData icon, String title, String subtitle) {
    return SwitchListTile(
      value: false,
      onChanged: (value) {},
      secondary: Icon(icon, color: Colors.deepPurple),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle, style: const TextStyle(fontSize: 12)),
    );
  }
}