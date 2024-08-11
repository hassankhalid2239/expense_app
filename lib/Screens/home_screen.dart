import 'package:expense_app/Database/boxes.dart';
import 'package:expense_app/Modals/money_model.dart';
import 'package:expense_app/Screens/transaction_screen.dart';
import 'package:expense_app/Screens/update_record_screen.dart';
import 'package:expense_app/Widgets/in_out_container.dart';
import 'package:expense_app/Screens/add_expense.dart';
import 'package:expense_app/Screens/add_income.dart';
import 'package:expense_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

import '../Controller/state_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final _stateController = Get.put(StateController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ValueListenableBuilder<Box<MoneyModel>>(
          valueListenable: Boxes.getRecords().listenable(),
          builder: (context, box, _) {
            var data = box.values.toList().cast<MoneyModel>();
            int totalIncome = 0;
            int totalExpense = 0;
            int total = 0;
            for (int i = 0; i < data.length; i++) {
              if (data[i].amountType == true) {
                totalIncome = totalIncome + data[i].amount;
              } else {
                totalExpense = totalExpense + data[i].amount;
              }
              total = totalIncome - totalExpense;
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Account Balance',
                    maxLines: 1,
                    style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff91919F)),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: FittedBox(
                    child: Text(
                      total.toString(),
                      // '9100',
                      maxLines: 1,
                      style: GoogleFonts.inter(
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Get.to(TransactionScreen(
                              transactionType: true,
                            ));
                          },
                          child: InOutContainer(
                              title: 'Income',
                              bgColor: const Color(0xff00A86B),
                              svgPath: 'assets/svg/Income.svg',
                              value: totalIncome.toString()
                              // value: '5000'
                              ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Get.to(TransactionScreen(
                              transactionType: false,
                            ));
                          },
                          child: InOutContainer(
                              title: 'Expenses',
                              bgColor: const Color(0xffFD3C4A),
                              svgPath: 'assets/svg/Outcome.svg',
                              value: totalExpense.toString()
                              // value: '5000'
                              ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      'All Transactions',
                      style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    trailing: PopupMenuButton(
                      tooltip: 'filter',
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      position: PopupMenuPosition.under,
                      color: Colors.white,
                      // color: Theme.of(context).colorScheme.surfaceBright,
                      icon: Icon(
                        Icons.filter_alt_outlined,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 1,
                          // onTap: (){
                          //   _taskController.getTasks();
                          // },
                          child: Obx(() {
                            return Text(
                              'Newest',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color:
                                        _stateController.selectedValue.value ==
                                                1
                                            ? Theme.of(context).primaryColor
                                            : Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.color,
                                  ),
                            );
                          }),
                        ),
                        PopupMenuItem(
                          value: 2,
                          child: Obx(() {
                            return Text(
                              'Oldest',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color:
                                        _stateController.selectedValue.value ==
                                                2
                                            ? Theme.of(context).primaryColor
                                            : Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.color,
                                  ),
                            );
                          }),
                        ),
                      ],
                      onSelected: (value) {
                        _stateController.updateSelectedValue(value);
                      },
                    ),
                  ),
                ),
                data.isNotEmpty
                    ? Obx(() {
                        return ListView.builder(
                          shrinkWrap: true,
                          reverse: _stateController.selectedValue.value == 1
                              ? true
                              : false,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: box.length,
                          itemBuilder: (context, index) {
                            String path = 'assets/svg/shop.svg';
                            for (int i = 0;
                                i < Constants.allCategoryIcons.length;
                                i++) {
                              if (data[index].category ==
                                  Constants.allCategoryIcons[i].title) {
                                path = Constants.allCategoryIcons[i].icon;
                              }
                            }
                            return ListTile(
                              onTap: () {
                                Get.to(UpdateRecordScreen(
                                  currentRecord: data[index],
                                ));
                              },
                              leading: SvgPicture.asset(path),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data[index].date,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.inter(
                                      color: const Color(0xff91919F),
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    data[index].category,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.inter(
                                      color: const Color(0xff292B2D),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              subtitle: Text(
                                data[index].detail,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.inter(
                                  color: const Color(0xff91919F),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              trailing: FittedBox(
                                child: Text(
                                  data[index].amount.toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.inter(
                                    color: data[index].amountType == true
                                        ? const Color(0xff00A86B)
                                        : const Color(0xffFD3C4A),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      })
                    : Center(
                        child: Text(
                          "There's no data!",
                          style: GoogleFonts.inter(
                              color: Colors.black, fontSize: 18),
                        ),
                      )
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 70,
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ButtonStyle(
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25))),
                    backgroundColor:
                        const WidgetStatePropertyAll(Color(0xffFD3C4A))),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddExpenseScreen()));
                },
                child: FittedBox(
                  child: Text(
                    'YOU GAVE',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.inter(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: ElevatedButton(
                style: ButtonStyle(
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25))),
                    backgroundColor:
                        const WidgetStatePropertyAll(Color(0xff00A86B))),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddIncome()));
                },
                child: FittedBox(
                  child: Text(
                    'YOU GOT',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.inter(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
