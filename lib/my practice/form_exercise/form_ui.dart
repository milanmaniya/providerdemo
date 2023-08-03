import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerdemo/my%20practice/form_exercise/provider_controller.dart';

class FormUiDemo extends StatefulWidget {
  const FormUiDemo({super.key});

  @override
  State<FormUiDemo> createState() => _FormUiDemoState();
}

class _FormUiDemoState extends State<FormUiDemo> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                    log(value.toString());
                    context.read<ProviderForm>().radio(value!);
                  },
                ),
                RadioListTile(
                  value: 'Female',
                  title: const Text('Female'),
                  groupValue: context.watch<ProviderForm>().gender,
                  onChanged: (value) {
                    log(value.toString());
                    context.read<ProviderForm>().radio(value!);
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text('Hobby: '),
                CheckboxListTile(
                  title: const Text('Cricket'),
                  value: context.watch<ProviderForm>().checkBoxList[0],
                  onChanged: (value) {
                    log(value.toString());
                    context.read<ProviderForm>().check(0, value!, 'Reading');
                    log(context.read<ProviderForm>().hobbeyList.toString());
                  },
                ),
                CheckboxListTile(
                  title: const Text('Reading'),
                  value: context.watch<ProviderForm>().checkBoxList[1],
                  onChanged: (value) {
                    log(value.toString());
                    context.read<ProviderForm>().check(1, value!, 'Reading');
                    log(context.read<ProviderForm>().hobbeyList.toString());
                  },
                ),
                CheckboxListTile(
                  title: const Text('Writing'),
                  value: context.watch<ProviderForm>().checkBoxList[2],
                  onChanged: (value) {
                    log(value.toString());
                    context.read<ProviderForm>().check(2, value!, 'Writing');
                    log(context.read<ProviderForm>().hobbeyList.toString());
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: (context
                                .watch<ProviderForm>()
                                .gender
                                .isNotEmpty &&
                            context.watch<ProviderForm>().hobbeyList.isNotEmpty)
                        ? () {
                            isPressed = true;
                            setState(() {});
                          }
                        : null,
                    child: const Text('submit'),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Consumer<ProviderForm>(
                    builder: (context, value, child) => isPressed
                        ? Text(
                            '${value.gender.toString()} \n ${value.hobbeyList.toString()}')
                        : const Text('Data not selected'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
