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
    print("Rebuild");
    final formProvider = context.read<ProviderForm>();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text('Gender: '),
                    const SizedBox(
                      width: 20,
                    ),
                    Radio(
                      value: 'Male',
                      groupValue: context.watch<ProviderForm>().gender,
                      onChanged: (value) {
                        log(value.toString());
                        context.read<ProviderForm>().radio(value!);
                      },
                    ),
                    const Text('Male'),
                    const SizedBox(
                      width: 20,
                    ),
                    Radio(
                      value: 'Female',
                      groupValue: context.watch<ProviderForm>().gender,
                      onChanged: (value) {
                        log(value.toString());
                        context.read<ProviderForm>().radio(value!);
                      },
                    ),
                    const Text('Female'),
                  ],
                ),
                // RadioListTile(
                //   value: 'Male',
                //   title: const Text('male'),
                //   groupValue: context.watch<ProviderForm>().gender,
                //   onChanged: (value) {
                //     log(value.toString());
                //     context.read<ProviderForm>().radio(value!);
                //   },
                // ),
                // RadioListTile(
                //   value: 'Female',
                //   title: const Text('Female'),
                //   groupValue: formProvider.gender,
                //   onChanged: (value) {
                //     log(value.toString());
                //     formProvider.radio(value!);
                //   },
                // ),
                const SizedBox(
                  height: 30,
                ),
                Selector<ProviderForm, bool>(
                  builder: (context, value, child) => Row(
                    children: [
                      const Text('Hobby: '),
                      Checkbox(
                        value: formProvider.checkBoxList[0],
                        onChanged: (value) {
                          log(value.toString());
                          formProvider.check(0, value!, 'Cricket');
                          log(formProvider.hobbeyList.toString());
                        },
                      ),
                      const Text('Cricket'),
                      Checkbox(
                        value: formProvider.checkBoxList[1],
                        onChanged: (value) {
                          log(value.toString());
                          formProvider.check(1, value!, 'Reading');
                          log(formProvider.hobbeyList.toString());
                        },
                      ),
                      const Text('Reading'),
                      Checkbox(
                        value: formProvider.checkBoxList[2],
                        onChanged: (value) {
                          log(value.toString());
                          formProvider.check(2, value!, 'Writing');
                          log(formProvider.hobbeyList.toString());
                        },
                      ),
                      const Text('Writing'),
                    ],
                  ),
                  selector: (context, obj) => obj.checkBoxList[0],
                ),

                // CheckboxListTile(
                //   title: const Text('Cricket'),
                //   value: formProvider.checkBoxList[0],
                //   onChanged: (value) {
                //     log(value.toString());
                //     formProvider.check(0, value!, 'Cricket');
                //     log(formProvider.hobbeyList.toString());
                //   },
                // ),
                // CheckboxListTile(
                //   title: const Text('Reading'),
                //   value: context.watch<ProviderForm>().checkBoxList[1],
                //   onChanged: (value) {
                //     log(value.toString());
                //     formProvider.check(1, value!, 'Reading');
                //     log(formProvider.hobbeyList.toString());
                //   },
                // ),
                // CheckboxListTile(
                //   title: const Text('Writing'),
                //   value: context.watch<ProviderForm>().checkBoxList[2],
                //   onChanged: (value) {
                //     log(value.toString());
                //     formProvider.check(2, value!, 'Writing');
                //     log(formProvider.hobbeyList.toString());
                //   },
                // ),
                const SizedBox(
                  height: 20,
                ),
                Selector<ProviderForm, bool>(
                  builder: (context, value, child) => Row(
                    children: [
                      const Text('I am Developer: '),
                      Switch(
                        value: context.watch<ProviderForm>().isSelectedValue,
                        onChanged: (value) {
                          formProvider.switchValue(value);
                          log(value.toString());
                        },
                      ),
                    ],
                  ),
                  selector: (context, obj) => obj.isSelectedValue,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text('Country: '),
                    Selector<ProviderForm, String>(
                        builder: (context, value, child) => DropdownButton(
                              hint: const Text('select country'),
                              value: formProvider.selectedValue,
                              items: formProvider.dropDownButtonList
                                  .map(
                                    (e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                formProvider.dropDownValue(value!);
                              },
                            ),
                        selector: (context, obj) {
                          return '';
                          
                        }),
                  ],
                ),

                const SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: (formProvider.gender.isNotEmpty &&
                            formProvider.hobbeyList.isNotEmpty)
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
                // Align(
                //   alignment: Alignment.center,
                //   child: Consumer<ProviderForm>(
                //     builder: (context, obj, child) => isPressed
                //         ? Text(
                //             '${obj.gender.toString()} \n ${obj.hobbeyList.toString()}')
                //         : const Text('Data not selected'),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
