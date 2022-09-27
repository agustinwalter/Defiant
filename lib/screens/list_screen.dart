import 'package:defiant/cubit/poap_cubit.dart';
import 'package:defiant/widget/poap_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Your NFTs',
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        titleSpacing: 0,
      ),
      body: BlocBuilder<PoapCubit, PoapState>(
        builder: (_, state) {
          if (state is PoapsLoaded) {
            return GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(22),
              mainAxisSpacing: 18,
              crossAxisSpacing: 18,
              childAspectRatio: .66,
              children: state.poaps.map((p) => PoapCard(poap: p)).toList(),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
