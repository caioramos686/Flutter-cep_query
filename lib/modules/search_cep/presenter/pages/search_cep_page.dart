import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volus_app/imports.dart';

class SearchCepPage extends StatefulWidget {
  const SearchCepPage({Key? key}) : super(key: key);

  @override
  State<SearchCepPage> createState() => _SearchCepPageState();
}

class _SearchCepPageState extends State<SearchCepPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController ufController = TextEditingController();
  final TextEditingController cidadeController = TextEditingController();
  final TextEditingController logradouroController = TextEditingController();

  @override
  void dispose() {
    ufController.dispose();
    cidadeController.dispose();
    logradouroController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CepCubit>(),
      child: BlocConsumer<CepCubit, CepState>(
        listener: (context, state) {
          if (state is CepErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Erro: ${state.message}')),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: const AppBarCustom(title: 'Consulta CEP'),
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      TextFormFieldComponent(
                        textCapitalization: TextCapitalization.characters,
                        hint: 'UF',
                        controller: ufController,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        maxLength: 2,
                        validator: cepValidator,
                      ),
                      const SizedBox(height: 10),
                      TextFormFieldComponent(
                        textCapitalization: TextCapitalization.sentences,
                        hint: 'Cidade',
                        controller: cidadeController,
                        keyboardType: TextInputType.streetAddress,
                        textInputAction: TextInputAction.next,
                        validator: cepValidator,
                      ),
                      const SizedBox(height: 10),
                      TextFormFieldComponent(
                        textCapitalization: TextCapitalization.sentences,
                        hint: 'Logradouro',
                        controller: logradouroController,
                        keyboardType: TextInputType.streetAddress,
                        validator: cepValidator,
                      ),
                      const SizedBox(height: 20),
                      CommonButton(
                        onTap: () {
                          if (!(formKey.currentState?.validate() ?? false)) {
                            return;
                          }
                          context.read<CepCubit>().getFullCep(
                                uf: ufController.text,
                                cidade: cidadeController.text,
                                logradouro: logradouroController.text,
                              );
                        },
                        text: 'Consultar',
                      ),
                      const SizedBox(height: 20),
                      if (state is CepLoadingState)
                        const Center(
                            child: CircularProgressIndicator(
                          color: AppColors.pinkColor,
                        ))
                      else if (state is CepSuccessState)
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.cepList.length,
                          itemBuilder: (context, index) {
                            final cep = state.cepList[index];
                            return ListTile(
                              title: Text('${cep.logradouro} - ${cep.cep}'),
                              subtitle: Text(
                                  '${cep.bairro}, ${cep.localidade} - ${cep.uf}'),
                            );
                          },
                        )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
