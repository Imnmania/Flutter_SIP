import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:kothon_app/logic/cubit/internet_cubit.dart';
import 'package:kothon_app/logic/cubit/toggle_button_cubit.dart';
import 'package:kothon_app/presentation/splash/splash_screen.dart';

void main() {
  runApp(MyApp(
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
  final Connectivity connectivity;
  const MyApp({
    Key? key,
    required this.connectivity,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ToggleButtonCubit(),
        ),
        BlocProvider(
            create: (context) => InternetCubit(connectivity: connectivity)),
      ],
      child: MaterialApp(
        title: 'Kothon',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xFF59E8F1),
          scaffoldBackgroundColor: Color(0xFFF9FAC7),
          fontFamily: 'Nunito',
        ),
        home: SplashScreen(),
      ),
    );
  }
}
