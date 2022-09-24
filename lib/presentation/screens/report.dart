import 'package:dropdown_below/dropdown_below.dart';
import 'package:flutter/material.dart';
import 'package:sabinpris/presentation/components/ui_component.dart';
import 'package:sabinpris/presentation/constants.dart';

class Report extends StatelessWidget {
  Report({Key? key}) : super(key: key);

  final TextEditingController _fullNameController = TextEditingController();

  List<DropdownMenuItem<Object?>> _dropdownLanguages = [];
  List<DropdownMenuItem<Object?>> _dropdownReports = [];
  final List<DropdownMenuItem<Object?>> _dropdownClasses = [];
  List<String> languages = ['English Sector', 'French Sector'];
  List<String> reports = ['Summary Report', 'Detailed Report'];
  List<String> classes = [
    'Pre-Nursery',
    'Nursery I',
    'Nursery II',
    'Class 1',
    'Class 2',
    'Class 3',
    'Class 4',
    'Class 5',
    'Class 6'
  ];

  List<DropdownMenuItem<Object?>> buildDropdownItems(List itemList) {
    List<DropdownMenuItem<Object?>> items = [];
    for (var i in itemList) {
      items.add(
        DropdownMenuItem(
          value: i,
          child: Text(i),
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    ValueNotifier<String> currentItemType = ValueNotifier(languages[0]);
    ValueNotifier<String> currentItemType2 = ValueNotifier(classes[0]);
    ValueNotifier<String> currentItemType3 = ValueNotifier(reports[0]);

    return Scaffold(
      backgroundColor: kBackgroundColorLight,
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
                  color: Colors.white,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Back(),
                        const Text(
                          'Financial Report',
                          style: TextStyle(
                            color: kGreenColor,
                            fontSize: 12,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.white,
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
                            children: const [
                              Icon(
                                Icons.download_rounded,
                                size: 16,
                              ),
                              SizedBox(width: 4),
                              Text(
                                'Download',
                                style: TextStyle(
                                  color: Color(0xff4D4D4D),
                                  fontSize: 10,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Report Type',
                        style: TextStyle(
                          color: kTextMainColorLight,
                          fontSize: 12,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    ValueListenableBuilder<String>(
                      valueListenable: currentItemType3,
                      builder:
                          (BuildContext context, String value3, Widget? child) {
                        return DropdownBelow(
                          value: value3,
                          itemWidth: size.width * .2,
                          itemTextstyle: const TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                          hint: Text(
                            'select a type of report',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12,
                              color: Colors.grey[300],
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          boxTextstyle: const TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                          boxDecoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: kGreenColor)),
                          boxPadding: const EdgeInsets.symmetric(
                              horizontal: 14.0, vertical: 4),
                          icon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Colors.black,
                            size: 25,
                          ),
                          boxHeight: 40,
                          dropdownColor: Colors.white,
                          items: _dropdownReports = buildDropdownItems(reports),
                          onChanged: (value3) {
                            currentItemType.value = value3.toString();
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Language Sector',
                                  style: TextStyle(
                                    color: kTextMainColorLight,
                                    fontSize: 12,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              ValueListenableBuilder<String>(
                                valueListenable: currentItemType,
                                builder: (BuildContext context, String value,
                                    Widget? child) {
                                  return DropdownBelow(
                                    value: value,
                                    itemWidth: size.width * .2,
                                    itemTextstyle: const TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    hint: Text(
                                      'select a language sector',
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 12,
                                        color: Colors.grey[300],
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    boxTextstyle: const TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    boxDecoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(color: kGreenColor)),
                                    boxPadding: const EdgeInsets.symmetric(
                                        horizontal: 14.0, vertical: 4),
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: Colors.black,
                                      size: 25,
                                    ),
                                    boxHeight: 40,
                                    dropdownColor: Colors.white,
                                    items: _dropdownLanguages =
                                        buildDropdownItems(languages),
                                    onChanged: (value) {
                                      currentItemType.value = value.toString();
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 40),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Class',
                                  style: TextStyle(
                                    color: kTextMainColorLight,
                                    fontSize: 12,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              ValueListenableBuilder<String>(
                                valueListenable: currentItemType2,
                                builder: (BuildContext context, String value2,
                                    Widget? child) {
                                  return DropdownBelow(
                                    value: value2,
                                    itemWidth: size.width * .2,
                                    itemTextstyle: const TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    hint: Text(
                                      'select a class',
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 12,
                                        color: Colors.grey[300],
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    boxTextstyle: const TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    boxDecoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(color: kGreenColor)),
                                    boxPadding: const EdgeInsets.symmetric(
                                        horizontal: 14.0, vertical: 4),
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: Colors.black,
                                      size: 25,
                                    ),
                                    boxHeight: 40,
                                    dropdownColor: Colors.white,
                                    items: _dropdownLanguages =
                                        buildDropdownItems(classes),
                                    onChanged: (value2) {
                                      currentItemType2.value =
                                          value2.toString();
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    LongButton(
                        size: size, color: kGreenColor, title: 'Generate'),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            // color: kBackgroundColorLight,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                              ),
                              const BoxShadow(
                                color: kBackgroundColorLight,
                                spreadRadius: -2.0,
                                blurRadius: 8.0,
                              ),
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
                                      flex: 2,
                                      child: Center(
                                          child: Text(
                                        '#',
                                        style: TextStyle(
                                            color: Colors.grey[400],
                                            fontSize: 10),
                                      )),
                                    ),
                                    Expanded(
                                      flex: 9,
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
                                            'Name',
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
                                            'Reg Fee',
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
                                            'Fee Amt.',
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
                                            'Fees Paid',
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
                                            'Balance',
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
                                child: ListView(
                                  physics: const BouncingScrollPhysics(),
                                  children: [
                                    ReportStudentTile(
                                      studentNumber: '1',
                                      studentName: 'Richard Nkolosombe Fimbo',
                                      studentRegFee: '5,000',
                                      studentFeeAmt: '70,000',
                                      studentFeePaid: '56,500',
                                      studentFeeBalance: '13,000',
                                    ),
                                    ReportStudentTile(
                                      studentNumber: '2',
                                      studentName: 'Desmond Piku Abanseka',
                                      studentRegFee: '5,000',
                                      studentFeeAmt: '70,000',
                                      studentFeePaid: '56,500',
                                      studentFeeBalance: '13,000',
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 30,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 11,
                                      child: Row(
                                        children: [
                                          const SizedBox(width: 20),
                                          Text(
                                            'Total',
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
                                            '10,000',
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
                                            '140,000',
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
                                            '108,000',
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
                                            '31,500',
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
                            ],
                          ),
                        ),
                      ),
                    )
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
