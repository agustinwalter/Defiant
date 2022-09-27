import 'package:bloc/bloc.dart';
import 'package:defiant/models/local_poaps_registry.dart';
import 'package:defiant/models/poap.dart';
import 'package:defiant/repositories/poap_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
part 'poap_state.dart';

class PoapCubit extends Cubit<PoapState> {
  PoapCubit() : super(const PoapInitial());

  Future<void> getPoaps(String address) async {
    try {
      emit(const PoapsLoading());
      final localPoapRepository = LocalPoapRepository();
      var poaps = await localPoapRepository.getAllByAddress(address);
      if (poaps.isEmpty) {
        poaps = await NetworkPoapRepository().getAllByAddress(address);
        if (poaps.isNotEmpty) {
          await localPoapRepository.save(
            LocalPoapsRegistry(address: address, poaps: poaps),
          );
        }
      }
      emit(PoapsLoaded(poaps));
    } catch (e) {
      emit(const PoapsError("Couldn't fetch Poaps."));
    }
  }
}
