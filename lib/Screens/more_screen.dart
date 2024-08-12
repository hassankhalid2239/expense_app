// ignore_for_file: deprecated_member_use

import 'package:expense_app/Controller/state_controller.dart';
import 'package:expense_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  final _stateController= Get.put(StateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 24,),
            ExpansionTile(
              backgroundColor: Theme.of(context).colorScheme.surfaceBright,
              collapsedBackgroundColor: Theme.of(context).colorScheme.surfaceBright,
              title: Text('Display',style:Theme.of(context).textTheme.displaySmall),
              iconColor:Theme.of(context).colorScheme.tertiary,
              collapsedIconColor: Theme.of(context).colorScheme.tertiary,
              children: [
                RadioListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      'Light',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    activeColor: const Color(0xffFD3C4A),
                    fillColor: const MaterialStatePropertyAll(
                        Color(0xffFD3C4A)),
                    value: 'Light',
                    groupValue: _stateController.selectedTheme.value,
                    onChanged: (value) {
                      Get.changeTheme(lightThemeData(context));
                      _stateController.updateSelectedTheme(value!);
                      // restartApp();
                    }),
                RadioListTile(
                    activeColor: const Color(0xffFD3C4A),
                    fillColor: const MaterialStatePropertyAll(
                        Color(0xffFD3C4A)),
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      'Dark',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    value: 'Dark',
                    groupValue: _stateController.selectedTheme.value,
                    onChanged: (value) {
                      Get.changeTheme(darkThemeData(context));
                      _stateController.updateSelectedTheme(value!);

                      // restartApp();
                    }),
                RadioListTile(
                    activeColor: const Color(0xffFD3C4A),
                    fillColor: const MaterialStatePropertyAll(
                        Color(0xffFD3C4A)),
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      'System Default',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    value: 'System Default',
                    groupValue: _stateController.selectedTheme.value,
                    onChanged: (value) {
                      _stateController.updateSelectedTheme(value!);
                      // restartApp();
                    }),
              ],
              onExpansionChanged: (value){},
            )
          ],
        ),
      ),
    );
  }
}
