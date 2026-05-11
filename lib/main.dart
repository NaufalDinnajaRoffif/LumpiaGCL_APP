import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const LumpiaApp());
}

class LumpiaApp extends StatelessWidget {
  const LumpiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.interTextTheme(),
        scaffoldBackgroundColor: const Color(0xFFFAF8FF),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAF8FF),
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          'Lumpia GCL',
          style: GoogleFonts.inter(
            color: const Color(0xFF004AC6),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_none, color: Color(0xFF004AC6)),
                onPressed: () {},
              ),
              Positioned(
                right: 12,
                top: 12,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              'Selamat datang, Mitra',
              style: GoogleFonts.inter(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF191B23),
              ),
            ),
            const SizedBox(height: 16),
            _buildOperationalHours(),
            const SizedBox(height: 24),
            _buildSummaryGrid(),
            const SizedBox(height: 24),
            _buildStockManagement(),
            const SizedBox(height: 24),
            _buildWeeklyPerformance(),
            const SizedBox(height: 120), // Memberi ruang untuk FAB dan BottomNav
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color(0xFF2563EB),
          shape: const CircleBorder(),
          child: const Icon(Icons.point_of_sale, color: Colors.white),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildOperationalHours() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F3FE),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF004AC6).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.schedule, color: Color(0xFF004AC6), size: 20),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('JAM OPERASIONAL', 
                style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w600, color: Colors.grey[600])),
              Text('08.00 - 19.00', 
                style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold)),
            ],
          ),
          const Spacer(),
          const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildSummaryGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 1.3,
      children: [
        _buildStatCard('Total Pendapatan\nHari Ini', '1 Jt', const Color(0xFF2563EB), Icons.payments),
        _buildStatCard('Belum Bayar', '3', const Color(0xFFBC4800), Icons.pending_actions),
        _buildStatCard('Jumlah Order', '5', const Color(0xFF00696B), Icons.shopping_cart_checkout),
        _buildStatCard('Jumlah Produk', '3', const Color(0xFF6B4FA3), Icons.inventory_2),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(8)),
            child: Icon(icon, color: Colors.white, size: 20),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(color: Colors.white70, fontSize: 11, fontWeight: FontWeight.w500)),
              Text(value, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w900)),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildStockManagement() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 20, offset: const Offset(0, 4))],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Manajemen Stok', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(color: const Color(0xFF004AC6).withOpacity(0.05), borderRadius: BorderRadius.circular(20)),
                child: const Text('LIVE', style: TextStyle(color: Color(0xFF004AC6), fontSize: 10, fontWeight: FontWeight.bold)),
              )
            ],
          ),
          const SizedBox(height: 16),
          _buildStockItem('Lumpia Besar', 'Signature', '12', Colors.orange[100]!),
          const SizedBox(height: 12),
          _buildStockItem('Lumpia Kecil', 'Snack', '15', Colors.orange[50]!),
        ],
      ),
    );
  }

  Widget _buildStockItem(String name, String cat, String qty, Color imgColor) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: const Color(0xFFF3F3FE), borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Container(
            width: 48, height: 48,
            decoration: BoxDecoration(color: imgColor, borderRadius: BorderRadius.circular(8)),
            child: const Icon(Icons.restaurant, color: Colors.brown, size: 20),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              Text('Kategori: $cat', style: const TextStyle(color: Colors.grey, fontSize: 11)),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(qty, style: const TextStyle(color: Color(0xFF004AC6), fontWeight: FontWeight.w900, fontSize: 18)),
              const Text('TERSEDIA', style: TextStyle(color: Colors.grey, fontSize: 8, fontWeight: FontWeight.bold)),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildWeeklyPerformance() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 20, offset: const Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Performa Mingguan', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('Minggu Lalu vs Minggu Ini', style: TextStyle(color: Colors.grey[600], fontSize: 11)),
                ],
              ),
              const Icon(Icons.insights, color: Colors.grey),
            ],
          ),
          const SizedBox(height: 24),
          // Perbaikan: Tinggi ditingkatkan ke 130 agar label hari tidak overflow
          SizedBox(
            height: 130, 
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildBarGroup('Sen', 40, 70),
                _buildBarGroup('Sel', 60, 85),
                _buildBarGroup('Rab', 30, 50),
                _buildBarGroup('Kam', 70, 95),
                _buildBarGroup('Jum', 50, 65),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Divider(height: 1),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildLegend(const Color(0xFF004AC6), 'MINGGU INI'),
              const SizedBox(width: 16),
              _buildLegend(Colors.grey[300]!, 'MINGGU LALU'),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildBarGroup(String day, double h1, double h2) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min, // Menjaga konten tetap rapat
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(width: 14, height: h1, decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(2))),
            const SizedBox(width: 4),
            Container(width: 14, height: h2, decoration: BoxDecoration(color: const Color(0xFF004AC6), borderRadius: BorderRadius.circular(2))),
          ],
        ),
        const SizedBox(height: 8),
        Text(day, style: const TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildLegend(Color color, String label) {
    return Row(
      children: [
        Container(width: 8, height: 8, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        const SizedBox(width: 6),
        Text(label, style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold, letterSpacing: -0.5)),
      ],
    );
  }

  Widget _buildBottomNav() {
    return Container(
      height: 85,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -2))],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(Icons.inventory_2_outlined, 'PRODUK', false),
          _navItem(Icons.home, 'HOME', true),
          _navItem(Icons.history, 'AKTIVITAS', false),
        ],
      ),
    );
  }

  Widget _navItem(IconData icon, String label, bool active) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: active ? BoxDecoration(color: const Color(0xFFF3F3FE), borderRadius: BorderRadius.circular(16)) : null,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: active ? const Color(0xFF004AC6) : Colors.grey, size: 24),
          const SizedBox(height: 4),
          Text(label, style: TextStyle(color: active ? const Color(0xFF004AC6) : Colors.grey, fontSize: 10, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}