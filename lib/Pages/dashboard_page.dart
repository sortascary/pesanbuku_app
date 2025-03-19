import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  final String userRole;
  

  DashboardScreen({Key? key, required this.userRole}) : super(key: key);

  Widget _buildInfoTextWithIcon(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.amber,
            ),
            padding: const EdgeInsets.all(10),
            child: Icon(icon, color: Colors.black, size: 24), 
          ),
          const SizedBox(width: 10), 
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(String title, String subtitle, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.amber.shade100,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.grey.shade400, blurRadius: 2)],
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.green.shade100,
            child: Icon(icon, color: Colors.green),
          ),
          const SizedBox(height: 10),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(subtitle,
              style: const TextStyle(fontSize: 12, color: Colors.black54)),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                userRole == "admin" ? 'Halo Admin' : 'Halo SMK RUS',
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            const Spacer(),
            const Icon(Icons.notifications, size: 24, color: Colors.black),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildHeader(),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              children: [
                if (userRole == "admin") ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildInfoTextWithIcon("11 Produk", Icons.inventory),
                              const SizedBox(height: 15), 
                              _buildInfoTextWithIcon("3000 Stock", Icons.warehouse),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildInfoTextWithIcon("5 Pesanan Hari Ini", Icons.local_shipping),
                              const SizedBox(height: 15), 
                              _buildInfoTextWithIcon("11 Pesanan Perlu Konfirmasi", Icons.access_time),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  GridView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 25,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1.2,
                    ),
                    children: [
                      _buildFeatureCard("Stok Buku", "13 buku", Icons.book),
                      _buildFeatureCard("Tagihan", "11 tagihan", Icons.receipt),
                    ],
                  ),
                  const SizedBox(height: 40),
                  _buildFeatureCard("Laporan Penjualan", "", Icons.bar_chart),
                ] else ...[
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Image.asset(
                      'assets/Images/order_now.png',
                      height: 150,
                      width: 150,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 50),
                  GridView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 25,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1.2,
                    ),
                    children: [
                      _buildFeatureCard("List Buku", "13 buku", Icons.book),
                      _buildFeatureCard("Tagihan", "11 tagihan", Icons.receipt),
                    ],
                  ),
                  const SizedBox(height: 40),
                  _buildFeatureCard("Order Buku", "", Icons.assignment),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}