// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/theme_controller.dart';

class MoreScreen extends StatelessWidget {
  MoreScreen({super.key});
  final ThemeController themeController = Get.find<ThemeController>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24,),
            ExpansionTile(
              backgroundColor: Theme.of(context).colorScheme.surfaceBright,
              collapsedBackgroundColor: Theme.of(context).colorScheme.surfaceBright,
              title: Text('Display',style:Theme.of(context).textTheme.displaySmall),
              iconColor:Theme.of(context).colorScheme.tertiary,
              collapsedIconColor: Theme.of(context).colorScheme.tertiary,
              children: [
                Obx((){
                  return RadioListTile<ThemeMode>(
                    title: Text('Light Mode',style: Theme.of(context).textTheme.bodyMedium,),
                    activeColor: const Color(0xffFD3C4A),
                    contentPadding: EdgeInsets.zero,
                    fillColor: const MaterialStatePropertyAll(
                        Color(0xffFD3C4A)),
                    value: ThemeMode.light,
                    groupValue: themeController.themeMode,
                    onChanged: (value) => themeController.changeThemeMode(value!),
                  );
                }),
                Obx((){
                  return RadioListTile<ThemeMode>(
                    title: Text('Dark Mode',style: Theme.of(context).textTheme.bodyMedium,),
                    activeColor: const Color(0xffFD3C4A),
                    contentPadding: EdgeInsets.zero,
                    fillColor: const MaterialStatePropertyAll(
                        Color(0xffFD3C4A)),
                    value: ThemeMode.dark,
                    groupValue: themeController.themeMode,
                    onChanged: (value) => themeController.changeThemeMode(value!),
                  );
                }),
                Obx((){
                  return RadioListTile<ThemeMode>(
                    title: Text('System Mode',style: Theme.of(context).textTheme.bodyMedium,),
                    value: ThemeMode.system,
                    activeColor: const Color(0xffFD3C4A),
                    contentPadding: EdgeInsets.zero,
                    fillColor: const MaterialStatePropertyAll(
                        Color(0xffFD3C4A)),
                    groupValue: themeController.themeMode,
                    onChanged: (value) => themeController.changeThemeMode(value!),
                  );
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
