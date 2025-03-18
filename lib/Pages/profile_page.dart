import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String userRole;

  const ProfilePage({Key? key, required this.userRole}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(userRole == "admin" ? "Admin Profile" : "Sekolah Profile"),
    );
  }
}