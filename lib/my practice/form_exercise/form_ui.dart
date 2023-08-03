import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerdemo/my%20practice/form_exercise/provider_controller.dart';

class FormUiDemo extends StatefulWidget {
  const FormUiDemo({super.key});

  @override
  State<FormUiDemo> createState() => _FormUiDemoState();
}

class _FormUiDemoState extends State<FormUiDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Gender: '),
            RadioListTile(
              value: 'Male',
              title: const Text('male'),
              groupValue: context.watch<ProviderForm>().gender,
              onChanged: (value) {
                context.read<ProviderForm>().radio(value!);
              },
            ),
            RadioListTile(
              value: 'Female',
              title: const Text('Female'),
              groupValue: context.watch<ProviderForm>().gender,
              onChanged: (value) {
                context.read<ProviderForm>().radio(value!);
              },
            ),
          ],
        ),
      ),
    );
  }
}
