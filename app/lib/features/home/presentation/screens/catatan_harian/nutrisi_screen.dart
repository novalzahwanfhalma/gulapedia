import 'package:flutter/material.dart';
import 'package:app/core/theme/colors.dart';
import 'package:go_router/go_router.dart';
import 'package:app/features/home/presentation/screens/catatan_harian/barcode_scanner_page.dart';


class NutrisiScreen extends StatefulWidget {
  const NutrisiScreen({super.key});

  @override
  State<NutrisiScreen> createState() => _NutrisiScreenState();
}

class _NutrisiScreenState extends State<NutrisiScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final List<Map<String, dynamic>> makananList = [
    {'nama': 'Sup, Kentang', 'grade': 'A', 'jumlah': '1,01 g'},
    {'nama': 'Perkedel Kentang', 'grade': 'A', 'jumlah': '1,48 g'},
    {'nama': 'Kentang Rebus Berbumbu', 'grade': 'A', 'jumlah': '0,96 g'},
    {'nama': 'Roti Kentang', 'grade': 'A', 'jumlah': '2,01 g'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        foregroundColor: Colors.black,
        title: const Text('Sarapan'),
        actions: [IconButton(icon: const Icon(Icons.tune), onPressed: () {})],
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Makan apa hari ini?',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.qr_code_scanner),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BarcodeScannerPage(),
                      ),
                    );
                  },
                ),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // Tabs
          TabBar(
            controller: _tabController,
            indicatorColor: AppColors.primary,
            labelColor: AppColors.primary,
            unselectedLabelColor: Colors.black,
            tabs: const [
              Tab(text: 'Paling sering'),
              Tab(text: 'Baru-baru ini'),
            ],
          ),

          // Header untuk daftar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(''),
                Row(
                  children: [
                    Text(
                      'Grade',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.info_outline, size: 16),
                  ],
                ),
              ],
            ),
          ),

          // List makanan
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildListMakanan(),
                _buildListMakanan(), // Bisa diganti nanti
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton.icon(
              onPressed: () {
                context.push('#');
              },
              label: const Text('Selesai (2 Asupan)'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                minimumSize: const Size.fromHeight(48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListMakanan() {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: makananList.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final item = makananList[index];
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 8),
          onTap: () {
            context.push('/catatan-harian/detail-menu');
          },
          title: Text(
            item['nama'],
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: Text('GRADE : ${item['grade']}'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                item['jumlah'],
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(Icons.add_circle_outline),
                onPressed: () {},
              ),
            ],
          ),
        );
      },
    );
  }
}
