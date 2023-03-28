// import 'package:better_open_file/better_open_file.dart';
import 'package:dropdown_below/dropdown_below.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sabinpris/domain/entity/expenditure.dart';
import 'package:sabinpris/domain/entity/statistics.dart';
import 'package:sabinpris/presentation/components/ui_component.dart';
import 'package:sabinpris/presentation/constants.dart';
import 'package:sabinpris/presentation/providers.dart';

class ExpenditureReport extends ConsumerStatefulWidget {
  const ExpenditureReport({Key? key}) : super(key: key);

  @override
  ConsumerState<ExpenditureReport> createState() => _ExpenditureReportState();
}

class _ExpenditureReportState extends ConsumerState<ExpenditureReport> {
  List<DropdownMenuItem<ExpenditureReportTypes?>> _dropdownReportTypes = [];

  late ValueNotifier<ExpenditureReportTypes> reportTypeNotifier;

  bool initLoad = true;

  @override
  void initState() {
    super.initState();
    reportTypeNotifier = ValueNotifier(ExpenditureReportTypes.General_Report);

    _dropdownReportTypes = buildDropdownItems<ExpenditureReportTypes>(
        ExpenditureReportTypes.values);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (initLoad) {
        setState(() {
          initLoad = false;
        });
      }
    });
  }

  List<DropdownMenuItem<T?>> buildDropdownItems<T>(List<T> itemList) {
    List<DropdownMenuItem<T?>> items = [];
    for (var item in itemList) {
      if (item is ExpenditureReportTypes) {
        items.add(
          DropdownMenuItem(
            value: item,
            child: Text(
              (item.name),
            ),
          ),
        );
      }
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final modeProvider = ref.watch(themeModeProvider);
    final currentMode = modeProvider.currentMode;

    final expStatsNotifier = ref.watch(expStatsProvider);
    final expStatistics = expStatsNotifier.expenditureStats;

    final totalStats = expStatsNotifier.totalStats;

    return Scaffold(
      backgroundColor:
          (!currentMode) ? kBackgroundColorLight : kBackgroundColorDark,
      body: Center(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            // Image.asset(
            //   'assets/grnbkgrnd.png',
            //   fit: BoxFit.cover,
            // ),
            Container(
              height: size.height * .9,
              width: size.height * 1.1,
              decoration: BoxDecoration(
                  color:
                      (!currentMode) ? Colors.white : const Color(0xff202020),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      spreadRadius: 4,
                      blurRadius: 4,
                      offset: const Offset(0, 0),
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Back(),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Expenditure Report',
                              style: TextStyle(
                                color: kGreenColor,
                                fontSize: 12,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Report Type',
                        style: TextStyle(
                          color: (!currentMode)
                              ? kTextMainColorLight
                              : kTextMainColorDark,
                          fontSize: 12,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    ValueListenableBuilder(
                        valueListenable: reportTypeNotifier,
                        builder: (context, sector, _) {
                          return DropdownBelow(
                            value: sector,
                            itemWidth: size.width * .2,
                            itemTextstyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12,
                              color:
                                  (!currentMode) ? Colors.black : Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                            hint: Text(
                              'select a language sector',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 12,
                                color: (!currentMode)
                                    ? Colors.grey[300]
                                    : Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            boxTextstyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12,
                              color:
                                  (!currentMode) ? Colors.black : Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                            boxDecoration: BoxDecoration(
                                color: (!currentMode)
                                    ? Colors.white
                                    : Colors.black,
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: kGreenColor)),
                            boxPadding: const EdgeInsets.symmetric(
                                horizontal: 14.0, vertical: 4),
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color:
                                  (!currentMode) ? Colors.black : Colors.white,
                              size: 25,
                            ),
                            boxHeight: 40,
                            dropdownColor:
                                (!currentMode) ? Colors.white : Colors.black,
                            items: _dropdownReportTypes,
                            onChanged: (value) {
                              reportTypeNotifier.value = value ??
                                  ExpenditureReportTypes.General_Report;
                            },
                          );
                        }),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          child: LongButton(
                            size: size,
                            color: kGreenColor,
                            title: 'Generate',
                            onTap: () {
                              ref
                                  .read(expStatsProvider)
                                  .search(reportTypeNotifier.value);
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () async {
                            try {
                              final file =
                                  await ref.read(expStatsProvider).download();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      backgroundColor: Colors.transparent,
                                      elevation: 0,
                                      content: Container(
                                        decoration: BoxDecoration(
                                            color: kGreenColor,
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        child: const Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Text(
                                            'Report Successfully Downloaded: File is saved in ../Documents/ folder',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      )));
                              // await OpenFile.open(file.path);
                            } catch (e) {
                              debugPrint("error");
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      backgroundColor: Colors.transparent,
                                      elevation: 0,
                                      content: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.red[400],
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        child: const Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Text(
                                            'Error Downloading Report: Please try again',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      )));
                            }
                          },
                          child: Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color:
                                  (!currentMode) ? Colors.white : Colors.black,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 4,
                                  offset: const Offset(0, 0),
                                )
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.download_rounded,
                                  size: 16,
                                  color: (!currentMode)
                                      ? Colors.black
                                      : Colors.white,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'Download',
                                  style: TextStyle(
                                    color: (!currentMode)
                                        ? const Color(0xff4D4D4D)
                                        : Colors.white,
                                    fontSize: 10,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Container(
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          // color: kBackgroundColorLight,
                          borderRadius: BorderRadius.circular(6),
                          color: (!currentMode) ? Colors.white : Colors.black,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                            ),
                            (!currentMode)
                                ? BoxShadow(
                                    color:
                                        kBackgroundColorDark.withOpacity(0.2),
                                    spreadRadius: -2.0,
                                    blurRadius: 8.0,
                                  )
                                : BoxShadow(
                                    color:
                                        kBackgroundColorLight.withOpacity(0.2),
                                    spreadRadius: -2.0,
                                    blurRadius: 8.0,
                                  )
                          ],
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Center(
                                        child: Text(
                                      '#',
                                      style: TextStyle(
                                          color: Colors.grey[400],
                                          fontSize: 10),
                                    )),
                                  ),
                                  Expanded(
                                    flex: 7,
                                    child: Row(
                                      children: [
                                        Text(
                                          '|',
                                          style: TextStyle(
                                              color: Colors.grey[400],
                                              fontSize: 16),
                                        ),
                                        const SizedBox(width: 20),
                                        Text(
                                          'Detail',
                                          style: TextStyle(
                                              color: Colors.grey[400],
                                              fontSize: 10),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Row(
                                      children: [
                                        Text(
                                          '|',
                                          style: TextStyle(
                                              color: Colors.grey[400],
                                              fontSize: 16),
                                        ),
                                        const SizedBox(width: 16),
                                        Text(
                                          'Amount',
                                          style: TextStyle(
                                              color: Colors.grey[400],
                                              fontSize: 10),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Row(
                                      children: [
                                        Text(
                                          '|',
                                          style: TextStyle(
                                              color: Colors.grey[400],
                                              fontSize: 16),
                                        ),
                                        const SizedBox(width: 16),
                                        Text(
                                          'Date',
                                          style: TextStyle(
                                              color: Colors.grey[400],
                                              fontSize: 10),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: expStatistics.length,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  ExpenseStatistics stats =
                                      expStatistics[index];
                                  return ExpenditureTile(
                                    index: index + 1,
                                    Detail: stats.name,
                                    Amount: NumberFormat().format(stats.amount),
                                    Date: stats.date,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: 30,
                    //   child: Row(
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     children: [
                    //       Expanded(
                    //         flex: 11,
                    //         child: Row(
                    //           children: [
                    //             const SizedBox(width: 20),
                    //             Text(
                    //               'Total',
                    //               style: TextStyle(
                    //                   color: Colors.grey[400], fontSize: 10),
                    //             )
                    //           ],
                    //         ),
                    //       ),
                    //       Expanded(
                    //         flex: 3,
                    //         child: Row(
                    //           children: [
                    //             Text(
                    //               '|',
                    //               style: TextStyle(
                    //                   color: Colors.grey[400], fontSize: 16),
                    //             ),
                    //             const SizedBox(width: 16),
                    //             Text(
                    //               NumberFormat().format(totalStats.amount),
                    //               style: TextStyle(
                    //                   color: (!currentMode)
                    //                       ? Colors.black
                    //                       : Colors.white,
                    //                   fontSize: 10),
                    //             )
                    //           ],
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
