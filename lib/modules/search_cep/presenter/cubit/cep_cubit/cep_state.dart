part of 'cep_cubit.dart';

abstract class CepState {}

class CepInitialState extends CepState {}

class CepLoadingState extends CepState {}

class CepErrorState extends CepState {
  final String message;

  CepErrorState(this.message);
}

class CepSuccessState extends CepState {
  final List<CepEntity> cepList;
  CepSuccessState(this.cepList);
}
