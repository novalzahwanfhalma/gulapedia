import 'package:flutter/material.dart';
import 'package:app/core/theme/colors.dart';
import 'package:go_router/go_router.dart';
import 'package:app/features/home/presentation/widgets/catatan_minggu_ini.dart';
import 'package:app/features/home/presentation/widgets/carousel_menu.dart';
import 'package:app/features/home/presentation/widgets/daftar_menu.dart';
import 'package:app/features/home/presentation/screens/catatan_harian/calendar_page.dart';

class CatatanHarianScreen extends StatefulWidget {
  const CatatanHarianScreen({super.key});

  @override
  State<CatatanHarianScreen> createState() => _CatatanHarianScreenState();
}

class _CatatanHarianScreenState extends State<CatatanHarianScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Atur Asupan \nsehat favoritmu',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: Icon(
                      Icons.calendar_today,
                      color: Colors.black,
                      size: 20,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  CalendarPage(), // hapus `const` kalau pakai StatefulWidget
                        ),
                      );
                    },
                  ),
                ),
              ],
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
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    splashFactory: NoSplash.splashFactory,
                    overlayColor: Colors.transparent,
                  ),
                  child: Text(
                    'Rincian',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.primary,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
          CatatanMingguIni(),
          Padding(
            padding: EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Resep Makanan',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          ),
          CarouselMenu(),
          Padding(
            padding: EdgeInsets.all(18.0),
            child: Text(
              'Nutrisi',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          DaftarMenu(),
        ],
      ),
    );
  }
}
