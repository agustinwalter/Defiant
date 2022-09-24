import 'package:defiant/cubit/poap_cubit.dart';
import 'package:defiant/screens/list_screen.dart';
import 'package:defiant/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const _vitaliksAddress = '0xd8da6bf26964af9d7eed9e03e53415d37aa96045';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _searchPoaps(BuildContext context) {
    final poapCubit = BlocProvider.of<PoapCubit>(context);
    poapCubit.getPoaps(_searchController.text);
  }

  void _goToListPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const ListScreen(),
      ),
    );
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: const Text(
          'The entered address does not contain NFTs',
        ),
        contentPadding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
        actionsPadding: const EdgeInsets.fromLTRB(0, 0, 10, 6),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('CLOSE'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        hintText: 'Type an Ethereum address',
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1.5,
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 18),
                  BlocConsumer<PoapCubit, PoapState>(
                    listener: (_, state) {
                      if (state is PoapsLoaded) {
                        if (state.poaps.isNotEmpty) {
                          _goToListPage();
                        } else {
                          _showErrorDialog();
                        }
                      }
                    },
                    builder: (_, state) {
                      return PrimaryButton(
                        text: 'SEARCH',
                        onPressed: () => _searchPoaps(context),
                        isLoading: state is PoapsLoading,
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () => _searchController.text = _vitaliksAddress,
                child: const Text(
                  'Load Vitalik\'s address ;)',
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
