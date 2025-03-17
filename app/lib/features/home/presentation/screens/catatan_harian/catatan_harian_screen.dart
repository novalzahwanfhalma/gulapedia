import 'package:flutter/material.dart';
import 'package:app/core/theme/colors.dart';
import 'package:app/features/home/presentation/widgets/catatan_minggu_ini.dart';
import 'package:app/features/home/presentation/widgets/carousel_menu.dart';
import 'package:app/features/home/presentation/widgets/daftar_menu.dart';

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
          Padding(padding: EdgeInsets.all(18.0), child: CatatanMingguIni()),
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
