import 'package:dropdown_below/dropdown_below.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabinpris/domain/entity/student_record.dart';
import 'package:sabinpris/presentation/components/ui_component.dart';
import 'package:sabinpris/presentation/constants.dart';
import 'package:sabinpris/presentation/providers.dart';

class AddExpenditure extends ConsumerStatefulWidget {
  const AddExpenditure({Key? key}) : super(key: key);

  @override
  ConsumerState<AddExpenditure> createState() => _AddExpenditureState();
}

class _AddExpenditureState extends ConsumerState<AddExpenditure> {
  final TextEditingController _commentController = TextEditingController();
  final TextEditingController _feesPaidController = TextEditingController();

  List<DropdownMenuItem<Expenditures?>> _dropdownExpenditures = [];

  late ValueNotifier<Expenditures> expenditureNotifier;
  bool initLoad = true;

  @override
  void initState() {
    super.initState();
    expenditureNotifier = ValueNotifier(Expenditures.Salaries);

    _dropdownExpenditures =
        buildDropdownItems<Expenditures>(Expenditures.values);
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
      if (item is Expenditures) {
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

    return Consumer(builder: (context, state, child) {
      final modeProvider = ref.watch(themeModeProvider);
      final currentMode = modeProvider.currentMode;
      return Scaffold(
        backgroundColor: (!currentMode) ? kTabColorLight : kTabColorDark,
        body: Center(
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Image.asset(
                'assets/bluebkgrnd.png',
                fit: BoxFit.cover,
              ),
              Container(
                height: size.height * .9,
                width: size.height * .8,
                decoration: BoxDecoration(
                    color: (!currentMode) ? Colors.white : Color(0xff202020),
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
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Back(),
                            Expanded(
                              child: Center(
                                child: const Text(
                                  'Add an Expenditure',
                                  style: TextStyle(
                                    color: kBlueColor,
                                    fontSize: 12,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Type of Expenditure',
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
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                '*',
                                style: TextStyle(
                                  color: kBlueColor,
                                  fontSize: 12,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        ValueListenableBuilder(
                            valueListenable: expenditureNotifier,
                            builder: (context, gender, _) {
                              return DropdownBelow(
                                value: gender,
                                itemWidth: size.width * .22,
                                itemTextstyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 12,
                                  color: (!currentMode)
                                      ? Colors.black
                                      : Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                                hint: Text(
                                  'select a type of expenditure',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 12,
                                    color: (!currentMode)
                                        ? Colors.grey[300]
                                        : Colors.grey[500],
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                boxTextstyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 12,
                                  color: (!currentMode)
                                      ? Colors.black
                                      : Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                                boxDecoration: BoxDecoration(
                                    color: (!currentMode)
                                        ? Colors.white
                                        : Colors.black,
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(color: kBlueColor)),
                                boxPadding: const EdgeInsets.symmetric(
                                    horizontal: 14.0, vertical: 4),
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: (!currentMode)
                                      ? Colors.black
                                      : Colors.white,
                                  size: 25,
                                ),
                                boxHeight: 40,
                                dropdownColor: (!currentMode)
                                    ? Colors.white
                                    : Colors.black,
                                items: _dropdownExpenditures,
                                onChanged: (g) {
                                  expenditureNotifier.value =
                                      g ?? Expenditures.Salaries;
                                },
                              );
                            }),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Comment',
                                style: TextStyle(
                                  color: (!currentMode)
                                      ? kTextMainColorLight
                                      : Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Container(
                          decoration: BoxDecoration(
                            color: (!currentMode) ? Colors.white : Colors.black,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 4,
                                offset: const Offset(0, 0),
                              )
                            ],
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: TextFormField(
                            maxLines: 8,
                            controller: _commentController,
                            enabled: true,
                            style: TextStyle(
                                backgroundColor: Colors.transparent,
                                color: (!currentMode)
                                    ? Colors.black
                                    : Colors.white,
                                fontSize: 12),
                            cursorColor: kBlueColor,
                            obscureText: false,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              fillColor: Colors.transparent,
                              filled: false,
                              hintText: 'Type any comments here',
                              hintStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 12,
                                color: (!currentMode)
                                    ? Colors.grey[300]
                                    : Colors.grey[500],
                                fontWeight: FontWeight.w400,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: kBlueColor, width: 1),
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Expenditure Cost',
                                style: TextStyle(
                                  color: (!currentMode)
                                      ? kTextMainColorLight
                                      : Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: ShortTextField(
                                  hint: '',
                                  controller: _feesPaidController,
                                  mainColor: kBlueColor,
                                  disable: false),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                'XAF',
                                style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 10,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        LongButton(
                            size: size,
                            color: kBlueColor,
                            title: 'Add',
                            onTap: () {}),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
