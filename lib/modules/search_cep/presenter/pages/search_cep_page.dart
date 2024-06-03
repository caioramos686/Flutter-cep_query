import 'package:flutter/material.dart';
import 'package:volus_app/imports.dart';

class SearchCepPage extends StatefulWidget {
  const SearchCepPage({Key? key}) : super(key: key);

  @override
  State<SearchCepPage> createState() => _SearchCepPageState();
}

class _SearchCepPageState extends State<SearchCepPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late final TextEditingController ufController = TextEditingController();
  late final TextEditingController cityController = TextEditingController();
  late final TextEditingController streetController = TextEditingController();

  @override
  void dispose() {
    ufController.dispose();
    cityController.dispose();
    streetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                const SizedBox(
                  height: 20,
                ),
                TextFormFieldComponent(
                  textCapitalization: TextCapitalization.characters,
                  hint: 'UF',
                  controller: ufController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  maxLength: 2,
                  validator: cepValidator,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormFieldComponent(
                  textCapitalization: TextCapitalization.sentences,
                  hint: 'Cidade',
                  controller: cityController,
                  keyboardType: TextInputType.streetAddress,
                  textInputAction: TextInputAction.next,
                  validator: cepValidator,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormFieldComponent(
                  textCapitalization: TextCapitalization.sentences,
                  hint: 'Logradouro',
                  controller: streetController,
                  keyboardType: TextInputType.streetAddress,
                  validator: cepValidator,
                ),
                const SizedBox(
                  height: 20,
                ),
                CommonButton(
                  onTap: () {
                    if (!(formKey.currentState?.validate() ?? false)) {
                      return;
                    }
                    print(streetController.text);
                    print(cityController.text);
                    print(ufController.text);
                  },
                  text: 'Consultar',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
