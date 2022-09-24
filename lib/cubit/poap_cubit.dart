import 'package:bloc/bloc.dart';
import 'package:defiant/models/poap.dart';
import 'package:defiant/repositories/poap_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
part 'poap_state.dart';

class PoapCubit extends Cubit<PoapState> {
  final PoapRepository _poapRepository;

  PoapCubit(this._poapRepository) : super(const PoapInitial());

  Future<void> getPoaps(String address) async {
    try {
      emit(const PoapsLoading());
      final poaps = await _poapRepository.fetchPoaps(address);
      emit(PoapsLoaded(poaps));
    } on NetworkException {
      emit(const PoapsError("Couldn't fetch Poaps. Is the device online?"));
    }
  }
}
