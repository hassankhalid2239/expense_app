// ignore_for_file: deprecated_member_use

import 'package:expense_app/Modals/money_model.dart';
import 'package:expense_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../Controller/state_controller.dart';

class AddIncome extends StatelessWidget {
  AddIncome({super.key});
  final _stateController = Get.put(StateController());
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _detailController = TextEditingController();
  final TextEditingController _dateController = TextEditingController(
      text: DateFormat('EEE, d MMM yyyy, hh:mma').format(DateTime.now()));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff00A86B),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color(0xff00A86B),
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
        ),
        title: Text(
          'Add Income',
          style: GoogleFonts.inter(color: Colors.white, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'How much?',
                style: GoogleFonts.inter(
                    color: const Color(0xffFCFCFC),
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                autofocus: true,
                controller: _amountController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '0',
                  hintStyle: GoogleFonts.inter(
                      color: const Color(0xffFCFCFC),
                      fontSize: 64,
                      fontWeight: FontWeight.w600),
                ),
                keyboardType: TextInputType.number,
                style: GoogleFonts.inter(
                    color: const Color(0xffFCFCFC),
                    fontSize: 64,
                    fontWeight: FontWeight.w600),
                cursorColor: Colors.transparent,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: BoxDecoration(
                color:Theme.of(context).scaffoldBackgroundColor,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Category',
                    style: GoogleFonts.inter(color: Theme.of(context).colorScheme.tertiary),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _categoryController,
                    keyboardType: TextInputType.none,
                    style: GoogleFonts.inter(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontSize: 16,
                    ),
                    onTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return makeDismissible(
                            context: context,
                            child: DraggableScrollableSheet(
                              initialChildSize: 0.52,
                              minChildSize: 0.1,
                              maxChildSize: 0.52,
                              builder: (context, scrollController) {
                                return Container(
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).colorScheme.surfaceBright,
                                      borderRadius: const BorderRadius.vertical(
                                          top: Radius.circular(20))),
                                  child: ListView.builder(
                                    controller: scrollController,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20),
                                    itemCount:
                                        Constants.incomeCategoryIcons.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        child: ListTile(
                                          onTap: () {
                                            _stateController
                                                    .incomeCategory.value =
                                                Constants
                                                    .incomeCategoryIcons[index]
                                                    .title;
                                            _categoryController.text =
                                                _stateController
                                                    .incomeCategory.value;
                                            Navigator.pop(context);
                                          },
                                          leading: SvgPicture.asset(Constants
                                              .incomeCategoryIcons[index].icon),
                                          title: Text(
                                            Constants.incomeCategoryIcons[index]
                                                .title,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.inter(
                                              color: Theme.of(context).colorScheme.tertiary,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                    decoration: InputDecoration(
                      suffixIcon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.grey,
                        size: 30,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                              color: Colors.grey, style: BorderStyle.solid)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide:  BorderSide(
                              color: Theme.of(context).colorScheme.tertiary,
                              width: 2,
                              style: BorderStyle.solid)),
                      hintText: 'Select Category',
                      hintStyle: GoogleFonts.inter(
                        color: const Color(0xff91919F),
                        fontSize: 16,
                      ),
                    ),
                    cursorColor: Colors.transparent,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Detail',
                    style: GoogleFonts.inter(color: Theme.of(context).colorScheme.tertiary),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _detailController,
                    style: GoogleFonts.inter(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                              color: Colors.grey, style: BorderStyle.solid)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide:  BorderSide(
                              color: Theme.of(context).colorScheme.tertiary,
                              width: 2,
                              style: BorderStyle.solid)),
                      hintText: 'Add detail',
                      hintStyle: GoogleFonts.inter(
                        color: const Color(0xff91919F),
                        fontSize: 16,
                      ),
                    ),
                    cursorColor: const Color(0xff00A86B),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Date',
                    style: GoogleFonts.inter(color: Theme.of(context).colorScheme.tertiary),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _dateController,
                    keyboardType: TextInputType.none,
                    style: GoogleFonts.inter(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontSize: 16,
                    ),
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          builder: (context, child) => Theme(
                                data: ThemeData().copyWith(
                                    colorScheme: ColorScheme.light(
                                        background: Theme.of(context)
                                            .colorScheme
                                            .background)),
                                child: child!,
                              ),
                          context: context,
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100));
                      if (pickedDate != null) {
                        _dateController.text =
                            DateFormat('EEE, d MMM yyyy, hh:mma')
                                .format(pickedDate);
                      } else {
                        _dateController.text =
                            DateFormat('EEE, d MMM yyyy, hh:mma')
                                .format(DateTime.now());
                      }
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                              color: Colors.grey, style: BorderStyle.solid)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide:  BorderSide(
                              color: Theme.of(context).colorScheme.tertiary,
                              width: 2,
                              style: BorderStyle.solid)),
                      hintText: 'Date',
                      suffixIcon: const Icon(
                        Icons.date_range,
                        color: Colors.grey,
                      ),
                      hintStyle: GoogleFonts.inter(
                        color: const Color(0xff91919F),
                        fontSize: 16,
                      ),
                    ),
                    cursorColor: Colors.transparent,
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16))),
                          backgroundColor: const WidgetStatePropertyAll(
                            Color(0xff00A86B),
                          )),
                      onPressed: () {
                        if (_amountController.text.isNotEmpty &&
                            _categoryController.text.isNotEmpty) {
                          final record = MoneyModel(
                              category: _categoryController.text,
                              detail: _detailController.text,
                              amount: int.parse(_amountController.text),
                              amountType: true,
                              date: _dateController.text);
                          _stateController.submitData(record);
                          Navigator.pop(context);
                        } else {
                          Get.snackbar(
                            'Required',
                            'All fields are required !',
                            backgroundColor: Colors.white,
                            snackPosition: SnackPosition.BOTTOM,
                            duration: const Duration(seconds: 1),
                            icon: const Icon(
                              Icons.warning_amber_rounded,
                              color: Colors.red,
                            ),
                            colorText: Colors.pinkAccent,
                          );
                        }
                      },
                      child: Text(
                        'Add',
                        style: GoogleFonts.inter(
                            color: const Color(0xffFCFCFC),
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  // SizedBox(height: 100,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget makeDismissible(
          {required Widget child, required BuildContext context}) =>
      GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.of(context).pop(),
        child: GestureDetector(
          onTap: () {},
          child: child,
        ),
      );
}
