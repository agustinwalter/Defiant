part of 'poap_cubit.dart';

@immutable
abstract class PoapState extends Equatable {
  const PoapState();
}

class PoapInitial extends PoapState {
  const PoapInitial();

  @override
  List<Object?> get props => [];
}

class PoapsLoading extends PoapState {
  const PoapsLoading();

  @override
  List<Object?> get props => [];
}

class PoapsLoaded extends PoapState {
  final List<Poap> poaps;

  const PoapsLoaded(this.poaps);

  @override
  List<Object?> get props => [poaps];
}

class PoapsError extends PoapState {
  final String message;
  const PoapsError(this.message);

  @override
  List<Object?> get props => [message];
}
