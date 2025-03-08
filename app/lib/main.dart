import 'package:flutter/material.dart';
import 'package:app/core/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/features/dashboard/bloc/navigation_bloc.dart';
import 'package:app/features/dashboard/presentation/home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gulapedia',
      theme: AppTheme.mainTheme,
      home: BlocProvider(
        create: (context) => NavigationBloc(),
        child: HomeScreen(),
      ),
    );
  }
}
