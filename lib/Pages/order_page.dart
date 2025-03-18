import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  final String userRole;

  OrderPage({required this.userRole});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          automaticallyImplyLeading: false, 
          backgroundColor: Colors.grey[200],
          elevation: 0,
          title: Text(
            userRole == "admin" ? "Admin Order" : "Sekolah Order",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.purple,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: "Jadwal"),
              Tab(text: "Diproses"),
              Tab(text: "History"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildOrderList("Jadwal"),
            _buildOrderList("Diproses"),
            _buildOrderList("History"),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.amber,
          child: Icon(Icons.add, size: 32, color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildOrderList(String status) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: 1, // Contoh data
        itemBuilder: (context, index) {
          return _buildOrderCard(status);
        },
      ),
    );
  }

  Widget _buildOrderCard(String status) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/images/book.png',
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.circle, color: Colors.green, size: 12),
                    SizedBox(width: 4),
                    Text(status, style: TextStyle(color: Colors.green)),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  "Pesanan 3",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  "MTK kelas 1, MTK kelas 2, MTK kelas 3, Pancasila kelas ...",
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ],
            ),
          ),
          Text(
            "RP 172.000",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }
}