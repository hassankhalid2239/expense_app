import 'package:expense_app/Database/boxes.dart';
import 'package:expense_app/Modals/money_model.dart';
import 'package:expense_app/Screens/update_record_screen.dart';
import 'package:expense_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

import '../Controller/state_controller.dart';

class TransactionScreen extends StatelessWidget {
  TransactionScreen({super.key, required this.transactionType});
  final bool transactionType;
  final _stateController = Get.put(StateController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).scaffoldBackgroundColor,
          statusBarIconBrightness: Theme.of(context).brightness,
        ),
        elevation: 0,
        automaticallyImplyLeading: true,
        foregroundColor: const Color(0xffF76C6A),
        centerTitle: true,
        forceMaterialTransparency: true,
        title: FittedBox(
          child: Text(
            transactionType == true
                ? 'Income Transactions'
                : 'Expense Transactions',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        actions: [
          PopupMenuButton(
            tooltip: 'filter',
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: _stateController.selectedIncomeValue.value == 1
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).textTheme.bodySmall?.color,
                        ),
                  );
                }),
              ),
              PopupMenuItem(
                value: 2,
                child: Obx(() {
                  return Text(
                    'Oldest',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: _stateController.selectedIncomeValue.value == 2
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).textTheme.bodySmall?.color,
                        ),
                  );
                }),
              ),
            ],
            onSelected: (value) {
              _stateController.updateSelectedIncomeValue(value);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: ValueListenableBuilder<Box<MoneyModel>>(
          valueListenable: Boxes.getRecords().listenable(),
          builder: (context, box, _) {
            var data = box.values.toList().cast<MoneyModel>();
            int totalIncome = 0;
            int totalExpense = 0;
            for (int i = 0; i < data.length; i++) {
              if (data[i].amountType == true) {
                totalIncome = totalIncome + data[i].amount;
              } else {
                totalExpense = totalExpense + data[i].amount;
              }
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(
                    transactionType == true
                        ? 'Total incomes'
                        : 'Total expenses',
                    style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  trailing: Text(
                    transactionType == true
                        ? totalIncome.toString()
                        : totalExpense.toString(),
                    style: GoogleFonts.inter(
                        color: transactionType == true
                            ? const Color(0xff00A86B)
                            : const Color(0xffFD3C4A),
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                data.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Obx(() {
                          return ListView.builder(
                            shrinkWrap: true,
                            reverse:
                                _stateController.selectedIncomeValue.value == 1
                                    ? true
                                    : false,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: box.length,
                            itemBuilder: (context, index) {
                              if (data[index].amountType == true &&
                                  transactionType == true) {
                                String path = 'assets/svg/shop.svg';
                                for (int i = 0;
                                    i < Constants.incomeCategoryIcons.length;
                                    i++) {
                                  if (data[index].category ==
                                      Constants.incomeCategoryIcons[i].title) {
                                    path =
                                        Constants.incomeCategoryIcons[i].icon;
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                              } else if (data[index].amountType == false &&
                                  transactionType == false) {
                                String path = 'assets/svg/shop.svg';
                                for (int i = 0;
                                    i < Constants.expenseCategoryIcons.length;
                                    i++) {
                                  if (data[index].category ==
                                      Constants.expenseCategoryIcons[i].title) {
                                    path =
                                        Constants.expenseCategoryIcons[i].icon;
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                              } else {
                                return const SizedBox();
                              }
                            },
                          );
                        }))
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
      // bottomNavigationBar: BottomAppBar(
      //   height: 70,
      //   color: Colors.white,
      //   child: Row(
      //     children: [
      //       Expanded(
      //         child: ElevatedButton(
      //           style: ButtonStyle(
      //               shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
      //               backgroundColor: const WidgetStatePropertyAll(Color(0xffFD3C4A))
      //           ),
      //           onPressed: (){
      //             Navigator.push(context, MaterialPageRoute(builder: (context)=>AddExpenseScreen()));
      //           },
      //           child: FittedBox(
      //             child: Text('YOU GAVE',
      //               maxLines: 1,
      //               overflow: TextOverflow.ellipsis,
      //               style: GoogleFonts.inter(
      //                   color: Colors.white,fontWeight: FontWeight.w600,
      //                   letterSpacing: 1
      //               ),),
      //           ),
      //         ),
      //       ),
      //       const SizedBox(width: 15,),
      //       Expanded(
      //         child: ElevatedButton(
      //           style: ButtonStyle(
      //               shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
      //               backgroundColor: const WidgetStatePropertyAll(Color(0xff00A86B))
      //           ),
      //           onPressed: (){
      //             Navigator.push(context, MaterialPageRoute(builder: (context)=>AddIncome()));
      //           },
      //           child: FittedBox(
      //             child: Text('YOU GOT',
      //               maxLines: 1,
      //               overflow: TextOverflow.ellipsis,
      //               style: GoogleFonts.inter(
      //                   color: Colors.white,fontWeight: FontWeight.w600,
      //                   letterSpacing: 1
      //               ),),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
