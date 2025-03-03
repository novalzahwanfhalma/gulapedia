import 'package:app/features/dashboard/presentation/widgets/bottom_navbar.dart';
import 'package:app/features/dashboard/presentation/widgets/data_minggu-ini.dart';
import 'package:app/features/dashboard/presentation/widgets/menu_carousel.dart';
import 'package:app/features/dashboard/presentation/widgets/menu_hari-ini.dart';
import 'package:app/features/dashboard/presentation/widgets/tombol_rincian.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: EdgeInsets.all(18.0),
            child: Text(
              'Atur asupan \nsehat favoritmu',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Minggu 3',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                TombolRincian(onPressed: () {}),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.all(18.0), child: DataHarian()),
          Padding(
            padding: EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Resep Makanan',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                TombolRincian(onPressed: () {}),
              ],
            ),
          ),
          Container(margin: EdgeInsets.all(18.0), child: MenuCarousel()),
          Padding(
            padding: EdgeInsets.all(18.0),
            child: Text(
              'Nutrisi',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          MenuHariIni(),
        ],
      ),
      bottomNavigationBar: BottomNavbar(),
    );
  }
}
