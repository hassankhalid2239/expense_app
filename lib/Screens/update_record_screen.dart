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

class UpdateRecordScreen extends StatefulWidget {
  final MoneyModel currentRecord;
  const UpdateRecordScreen({super.key, required this.currentRecord});

  @override
  State<UpdateRecordScreen> createState() => _UpdateRecordScreenState();
}

class _UpdateRecordScreenState extends State<UpdateRecordScreen> {
  final _stateController = Get.put(StateController());
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _detailController = TextEditingController();
  final TextEditingController _dateController = TextEditingController(
      text: DateFormat('EEE, d MMM yyyy, hh:mma').format(DateTime.now()));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _amountController.text = widget.currentRecord.amount.toString();
    _categoryController.text = widget.currentRecord.category;
    _detailController.text = widget.currentRecord.detail;
    _dateController.text = widget.currentRecord.date;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _amountController.dispose();
    _dateController.dispose();
    _categoryController.dispose();
    _detailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.currentRecord.amountType == true
          ? const Color(0xff00A86B)
          : const Color(0xffFD3C4A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: widget.currentRecord.amountType == true
              ? const Color(0xff00A86B)
              : const Color(0xffFD3C4A),
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
        ),
        title: Text(
          widget.currentRecord.amountType == true
              ? 'Edit Income'
              : 'Edit Expense',
          style: GoogleFonts.inter(color: Colors.white, fontSize: 18),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                bottomSheet(context);
              },
              icon: SvgPicture.asset('assets/svg/delete.svg'),
            ),
          )
        ],
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
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
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
                    style: GoogleFonts.inter(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _categoryController,
                    keyboardType: TextInputType.none,
                    style: GoogleFonts.inter(
                      color: Colors.black,
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
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(20))),
                                  child: ListView.builder(
                                    controller: scrollController,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20),
                                    itemCount: widget
                                                .currentRecord.amountType ==
                                            true
                                        ? Constants.incomeCategoryIcons.length
                                        : Constants.expenseCategoryIcons.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        child: ListTile(
                                          onTap: () {
                                            if (widget
                                                .currentRecord.amountType) {
                                              _stateController
                                                      .incomeCategory.value =
                                                  Constants
                                                      .incomeCategoryIcons[
                                                          index]
                                                      .title;
                                              _categoryController.text =
                                                  _stateController
                                                      .incomeCategory.value;
                                              Navigator.pop(context);
                                            } else {
                                              _stateController
                                                      .expenseCategory.value =
                                                  Constants
                                                      .expenseCategoryIcons[
                                                          index]
                                                      .title;
                                              _categoryController.text =
                                                  _stateController
                                                      .expenseCategory.value;
                                              Navigator.pop(context);
                                            }
                                          },
                                          leading: SvgPicture.asset(widget
                                                      .currentRecord
                                                      .amountType ==
                                                  true
                                              ? Constants
                                                  .incomeCategoryIcons[index]
                                                  .icon
                                              : Constants
                                                  .expenseCategoryIcons[index]
                                                  .icon),
                                          title: Text(
                                            widget.currentRecord.amountType ==
                                                    true
                                                ? Constants
                                                    .incomeCategoryIcons[index]
                                                    .title
                                                : Constants
                                                    .expenseCategoryIcons[index]
                                                    .title,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.inter(
                                              color: const Color(0xff292B2D),
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
                          borderSide: const BorderSide(
                              color: Colors.black,
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
                    style: GoogleFonts.inter(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _detailController,
                    style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                              color: Colors.grey, style: BorderStyle.solid)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                              color: Colors.black,
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
                    style: GoogleFonts.inter(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _dateController,
                    keyboardType: TextInputType.none,
                    style: GoogleFonts.inter(
                      color: Colors.black,
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
                          borderSide: const BorderSide(
                              color: Colors.black,
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
                          backgroundColor: WidgetStatePropertyAll(
                            widget.currentRecord.amountType == true
                                ? const Color(0xff00A86B)
                                : const Color(0xffFD3C4A),
                          )),
                      onPressed: () {
                        if (_amountController.text.isNotEmpty &&
                            _categoryController.text.isNotEmpty) {
                          widget.currentRecord.amount =
                              int.parse(_amountController.text);
                          widget.currentRecord.category =
                              _categoryController.text;
                          widget.currentRecord.detail = _detailController.text;
                          widget.currentRecord.date = _dateController.text;
                          widget.currentRecord.save();
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
                        'Save',
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

  void bottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return SizedBox(
          height: 150,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        _stateController.deleteData(widget.currentRecord);
                        Navigator.pop(context);
                        Navigator.pop(context);
                        // Get.back();
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              const WidgetStatePropertyAll(Colors.white),
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)))),
                      child: Text(
                        'Yes',
                        style: GoogleFonts.montserrat(
                            fontSize: 17,
                            letterSpacing: 5,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xffF76C6A)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              const WidgetStatePropertyAll(Colors.white),
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)))),
                      child: Text('No',
                          style: GoogleFonts.montserrat(
                              fontSize: 17,
                              letterSpacing: 5,
                              fontWeight: FontWeight.w600,
                              color: Colors.black)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
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
