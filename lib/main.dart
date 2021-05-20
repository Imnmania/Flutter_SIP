import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kothon_app/logic/cubit/toggle_button_cubit.dart';
import 'package:kothon_app/presentation/splash/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ToggleButtonCubit(),
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
