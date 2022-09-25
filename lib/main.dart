import 'package:defiant/cubit/poap_cubit.dart';
import 'package:defiant/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const Defiant());

class Defiant extends StatelessWidget {
  const Defiant({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PoapCubit(),
      child: MaterialApp(
        title: 'Defiant',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.green),
        home: const HomeScreen(),
      ),
    );
  }
}
