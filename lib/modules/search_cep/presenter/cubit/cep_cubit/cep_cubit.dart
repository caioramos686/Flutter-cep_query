import 'package:bloc/bloc.dart';
import 'package:volus_app/imports.dart';

part 'cep_state.dart';

class CepCubit extends Cubit<CepState> {
  final ICepRepository repository;
  CepCubit(this.repository) : super(CepInitialState());

  Future<void> getFullCep(
      {required String uf,
      required String cidade,
      required String logradouro}) async {
    emit(CepLoadingState());
    try {
      var cepList = await repository.getFullCep(uf, cidade, logradouro);
      emit(CepSuccessState(cepList));
    } catch (e) {
      emit(CepErrorState(e.toString()));
    }
  }
}
